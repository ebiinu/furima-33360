require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全部正しく記入すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが英数字混同であれば登録できる' do
        @user.nickname = 'aaaaaa1'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
      it 'passwordが数字を含まない場合は登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password",
                                                      'Password is invalid. Input both letters and numbers.'
      end
      it 'passwordが英字を含まない場合は登録できない' do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password",
                                                      'Password is invalid. Input both letters and numbers.'
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'family_nameが全角でない場合登録できない' do
        @user.family_name = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name is invalid. Input full-width characters.'
      end
      it 'first_nameが全角でない場合登録できない' do
        @user.first_name = 'sayaka'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters.'
      end
      it 'family_name_kanaが全角カタカナでない場合登録できない' do
        @user.family_name_kana = 'あべ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana is invalid. Input full-width katakana characters.'
      end
      it 'first_name_kanaが全角カタカナでない場合登録できない' do
        @user.first_name_kana = 'さやか'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid. Input full-width katakana characters.'
      end
      it 'emailは＠がついていない場合登録できない' do
        @user.email = 'aaaaaa1gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
    end
  end
end
