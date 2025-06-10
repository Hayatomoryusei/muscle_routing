class AiChatsController < ApplicationController
  def create
    input = params[:message]

    if input.present?
      ai_response = ChatgptAdvisor.get_advice(input)
      flash[:ai_response] = ai_response
    else
      flash[:ai_response] = "入力が空です。質問を入力してください。"
    end

    redirect_to motivations_path
  end
end

