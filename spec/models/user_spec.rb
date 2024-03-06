require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors[:password]).to include("は英字と数字の両方を含めて設定してください")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors[:password]).to include("は英字と数字の両方を含めて設定してください")
      end
      it 'passwordが全角文字を含むと登録できない' do
        @user.password = '12345あ'
        @user.password_confirmation = '12345あ'
        @user.valid?
        expect(@user.errors[:password]).to include("は英字と数字の両方を含めて設定してください")
      end
      it 'last_nameとfirst_nameがそれぞれ必須であること' do
        @user.last_name = nil
        @user.first_name = nil
        @user.valid?
        expect(@user.errors[:last_name]).to include("can't be blank", "全角文字を使用してください")
        expect(@user.errors[:first_name]).to include("can't be blank", "全角文字を使用してください")
      end
      it 'last_nameとfirst_nameが全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'tarou'
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors[:last_name]).to include("全角文字を使用してください")
        expect(@user.errors[:first_name]).to include("全角文字を使用してください")
      end
      it 'last_name_kanaとfirst_name_kanaがそれぞれ必須であること' do
        @user.last_name_kana = nil
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include("can't be blank", "全角カタカナを使用してください")
        expect(@user.errors[:first_name_kana]).to include("can't be blank", "全角カタカナを使用してください")
      end
      it 'last_name_kanaとfirst_name_kanaが全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'たろう'
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include("全角カタカナを使用してください")
        expect(@user.errors[:first_name_kana]).to include("全角カタカナを使用してください")
      end
    end
  end
end