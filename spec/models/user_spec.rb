require 'rails_helper'

describe User do
    before do
      @user = FactoryBot.build(:user)
    end

  describe "ユーザー新規登録" do
    context "新規登録がうまくいくとき" do

      it "nickname, family_name, first_name, family_name_kana, first_name_kana, birth_day, password, password_confirmation, emailが存在すれば登録できること" do
      expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できること" do
      @user.password = "abc123"
      @user.password_confirmation = "abc123"
      expect(@user).to be_valid
      end
      it "passwordが英数字である場合は登録できる" do
      @user.password = "abc123"
      @user.password_confirmation = "abc123"
      @user.valid?
      expect(@user).to be_valid
      end
      it "emailが@を含んでいる場合は登録できる" do
      @user.email ="xxx@mail.com"
      @user.valid?
      expect(@user).to be_valid
      end
      it "family_nameが全角である場合は登録できること" do
      @user.family_name = "山田"
      @user.valid?
      expect(@user).to be_valid
      end
      it "first_nameが全角である場合は登録できること" do
      @user.first_name = "陸太郎"
      @user.valid?
      expect(@user).to be_valid
      end
      it "first_name_kanaが全角カタカナである場合は登録できること" do
      @user.first_name_kana = "タロウ"
      @user.valid?
      expect(@user).to be_valid
      end
      it "family_name_kanaが全角カタカナである場合は登録できること" do
      @user.family_name_kana = "ヤマダ"
      @user.valid?
      expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do

      it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "family_nameが空では登録できないこと" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is Full-width characters")
      end
      it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "family_name_kanaが空では登録できないこと" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is Full-width characters")
      end
      it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is Full-width characters")
      end
      it "birth_dayが空では登録できないこと" do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password please type using half-width characters\n    ", "Password is too short (minimum is 6 characters)", "Password confirmation doesn't match Password")
      end
      it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank", "Email is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英数字でない場合は登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include( "Password please type using half-width characters\n    ")
      end
      it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "family_nameが全角でない場合は登録できないこと" do
      @user.family_name = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is Full-width characters")
      end
      it "first_nameが全角でない場合は登録できないこと" do
      @user.first_name = "ﾘｸﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is Full-width characters")
      end
      it "family_name_kanaが全角でない場合は登録できないこと" do
      @user.family_name_kana = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is Full-width characters")
      end
      it "family_name_kanaがカタカナでない場合は登録できないこと" do
      @user.family_name_kana = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is Full-width characters")
      end
      it "first_name_kanaが全角でない場合は登録できないこと" do
      @user.first_name_kana = "ﾘｸﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is Full-width characters")
      end
      it "family_name_kanaがカタカナでない場合は登録できないこと" do
      @user.first_name_kana = "rikutarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is Full-width characters")
      it "@が含まれていない場合登録出来ない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't inclede @", "Email is invalid")
        
      end
    end
  end
end