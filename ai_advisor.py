# ai_advisor.py（筋トレ向けコメント）
import sys

input_text = sys.argv[1]

if "週3" in input_text or "毎週3" in input_text:
    print("週3回は継続力のカギ！筋肉痛が出た日は休息も大事にしましょう。")
elif "毎日" in input_text:
    print("毎日筋トレは意識高い！ただし部位ごとのローテーションも忘れずに。")
elif "体重" in input_text:
    print("体重管理には食事も超大事！PFCバランスも意識してみましょう。")
else:
    print("目標設定ありがとうございます！一歩ずつ一緒に進んでいきましょう💪")
