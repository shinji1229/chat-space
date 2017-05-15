require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }
  let(:message) {create(:message), user: user, group: user.groups.first}
  describe 'GET #index' do

    context'ログインしていない場合' do

    end

    context'ユーザーがログインしていない場合' do
    before do
      login_user user
      get :index
    end


      it 'assigns all users as @messages' do
        expect(assigns(:message)).to match(tweets)
      end
      it '@group = Group.find(params[:group_id])' do
      end
      it '@groups = current_user.groups.order("created_at DESC")' do
      end
      it '@users = @group.users' do
      end
      it '@message = Message.new' do
      end
      it 'renders the :index template ' do
        get :index
        expect(response).to render_template :index
      end
    end

    end
  end





  describe 'POST #create' do
    context'ログインしていない場合' do

    end

    context'ユーザーがログインしていない場合' do
    before do
      login_user user
    end

    context 'with valid params' do
      it 'creates a new message' do
      end
      it 'assigns a newly created message as @message' do
      end
      it 'redirects to the group_messages_path' do
        expect(response).to redirect_to group_messages_path
      end

    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved user as @message' do
      end
      it 're-renders the "index" template' do
        expect(response).to render_template :index
      end
    end
  end
  end
end