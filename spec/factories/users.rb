FactoryBot.define do
  factory :user do
    nickname              { 'さとし' }
    email                 { 'test@example' }
    password              { '111aaa' }
    password_confirmation { password }
    first_name            { '智史' }
    last_name             { '中山' }
    first_kana_name       { 'サトシ' }
    last_kana_name        { 'ナカヤマ' }
    birthday              { '1974-07-16' }
  end
end
