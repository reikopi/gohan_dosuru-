# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@members = Member.create!(
  [
    {email: 'kumiko_mama@test.com', name: 'くみこママ', password: 'password', group_id: 1},
    {email: 'takashi_papa@test.com', name: 'たかしパパ', password: 'password', group_id: 1},
    {email: 'hanako@test.com', name: 'はなこ', password: 'password', group_id: 1},
    {email: 'takako@test.com', name: 'たかこ', password: 'password', group_id: 1},
    {email: 'nanako@test.com', name: '菜々子', password: 'password', group_id: 1},
    {email: 'taro@test.com', name: 'TARO', password: 'password', group_id: 1},
    {email: 'jiro@test.com', name: 'ジロー', password: 'password', group_id: 1},
    {email: 'kotaro@test.com', name: 'こたろう', password: 'password', group_id: 2},
    {email: 'keiko@test.com', name: 'けいこ', password: 'password'}
  ]
)

@groups = Group.create!(
  [
    {group_code: 'wakuwaku', group_name: 'ワクワクハウス', password: '119246',admin_member_id: 1},
    {group_code: 'piyopiyo', group_name: 'ぴよぴよ家', password: '119246',admin_member_id: 8}
  ]
)

@my_schedules = MySchedule.create!(
  [
    {member_id: 1, start_date: '2022-11-13', morning_select: 'true', lunch_select: 'true', dinner_select: 'true', supplement: 'お昼はお弁当で'},
    {member_id: 2, start_date: '2022-11-12', morning_select: 'false', lunch_select: 'false', dinner_select: 'true', supplement: 'お弁当不要'},
    {member_id: 2, start_date: '2022-11-13', morning_select: 'false', lunch_select: 'false', dinner_select: 'false', supplement: '1日外出します'},
    {member_id: 3, start_date: '2022-11-13', morning_select: 'true', lunch_select: 'false', dinner_select: 'false', supplement: '昼から外出します'},
    {member_id: 3, start_date: '2022-11-14', morning_select: 'true', lunch_select: 'ture', dinner_select: 'false', supplement: 'お昼はお弁当作ってください。夜は飲み会です'},
    {member_id: 4, start_date: '2022-11-13', morning_select: 'true', lunch_select: 'true', dinner_select: 'true', supplement: 'お昼はお弁当で'},
    {member_id: 5, start_date: '2022-11-12', morning_select: 'false', lunch_select: 'false', dinner_select: 'true', supplement: 'お弁当不要'},
    {member_id: 5, start_date: '2022-11-13', morning_select: 'false', lunch_select: 'false', dinner_select: 'false', supplement: '1日外出します'},
    {member_id: 6, start_date: '2022-11-13', morning_select: 'true', lunch_select: 'false', dinner_select: 'false', supplement: '昼から外出します'},
    {member_id: 6, start_date: '2022-11-14', morning_select: 'true', lunch_select: 'ture', dinner_select: 'false', supplement: 'お昼はお弁当作ってください。夜は飲み会です'},
    {member_id: 7, start_date: '2022-11-13', morning_select: 'true', lunch_select: 'true', dinner_select: 'true', supplement: 'お昼はお弁当で'},
    {member_id: 8, start_date: '2022-11-12', morning_select: 'false', lunch_select: 'false', dinner_select: 'true', supplement: 'お弁当不要'},
    {member_id: 8, start_date: '2022-11-13', morning_select: 'false', lunch_select: 'false', dinner_select: 'false', supplement: '1日外出します'},
    {member_id: 9, start_date: '2022-11-13', morning_select: 'true', lunch_select: 'true', dinner_select: 'false', supplement: '夜は友達とご飯'},
    {member_id: 9, start_date: '2022-11-14', morning_select: 'true', lunch_select: 'false', dinner_select: 'false', supplement: '昼から外出します'},
  ]


)

@news = News.create!(
  [
    {group_id: 1, member_id: 1, title: '今日の夕飯',message: '焼き肉です'},
    {group_id: 1, member_id: 1, title: '夕飯の時間',message: '前の用事が長引いたので夕飯の時間は２０時になりそうです'},
    {group_id: 1, member_id: 2, title: '夕飯について',message: 'スーパーに寄ったので材料を買っておきました'},
    {group_id: 2, member_id: 8, title: '今日の夕飯',message: '風邪をひいたので各自用意してください'},
  ]
)