require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、firstnameとlastname、firstkanaとlastkana、birthdayが存在すれば登録できる' do
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
        @user.password = 'test111'
        @user.password_confirmation = 'test000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'firstkanaが空では登録できない' do
        @user.firstkana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstkana can't be blank")
      end
      it 'lastkanaが空では登録できない' do
        @user.lastkana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastkana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが英語だけでは登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'firstnameに英語と半角が入っていると登録できない' do
        @user.firstname = 'Tom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid. Input full-width characters')
      end
      it 'lastnameに英語と半角が入っていると登録できない' do
        @user.lastname = 'Brown'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid. Input full-width characters')
      end
      it 'firstkanaに漢字が入っていると登録できない' do
        @user.firstkana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstkana is invalid. Input full-width katakana characters')
      end
      it 'firstkanaに英語と半角が入っていると登録できない' do
        @user.firstkana = 'Tom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstkana is invalid. Input full-width katakana characters')
      end
      it 'firstkanaにひらがなが入っていると登録できない' do
        @user.firstkana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstkana is invalid. Input full-width katakana characters')
      end
      it 'lastkanaに英語と半角が入っていると登録できない' do
        @user.lastkana = 'Brown'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastkana is invalid. Input full-width katakana characters')
      end
      it 'lastkanaに漢字が入っていると登録できない' do
        @user.lastkana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastkana is invalid. Input full-width katakana characters')
      end
      it 'lastkanaにひらがなが入っていると登録できない' do
        @user.lastkana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastkana is invalid. Input full-width katakana characters')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'テスト123'
        @user.password_confirmation = 'テスト123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
    end
  end
end
