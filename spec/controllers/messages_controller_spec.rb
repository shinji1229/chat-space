require 'rails_helper'

describe MessagesController do
  describe 'GET #index' do
    context 'ログインしている場合' do
      it '@messagesに全てのメッセージを割り当てること' do
      end
      it '@group = Group.find(params[:group_id])' do
      end
      it '@groups = current_user.groups.order("created_at DESC")' do
      end
      it '@users = @group.users' do
      end
      it '@message = Message.new' do
      end
      it 'index画面を表示' do
      end
    end
    context 'ログインしていない場合' do
      it 'サインイン画面を表示' do
      end
    end
  end





  describe 'POST #create' do
    context 'bodyがある場合' do
      it 'データベースに新しいメッセージが登録される' do
      end
      it 'group_messages_pathにリダイレクトする' do
      end

    end

    context 'bodyがない場合' do
      it 'データベースに新しいメッセージが登録されない' do
      end
      it 'newテンプレートを再表示すること' do
      end
    end
  end
end