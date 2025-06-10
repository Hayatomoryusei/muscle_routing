class ChatgptAdvisor
  def self.get_advice(input_text)
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])

    begin
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [
            { role: "system", content: "あなたは筋トレ目標のアドバイザーです。" },
            { role: "user", content: input_text }
          ]
        }
      )

      puts "🔁 ChatGPT response: #{response.inspect}"

      response.dig("choices", 0, "message", "content") || "AIアドバイスの取得に失敗しました"
    rescue => e
      puts "❌ ChatGPT API error: #{e.message}"
      "AIアドバイスの取得に失敗しました"
    end
  end
end
