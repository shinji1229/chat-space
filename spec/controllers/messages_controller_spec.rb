require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }
  let(:message) { create(:message, user: user, group: user.groups.first) }

  describe 'GET #index' do

    context' ログインしていない場合' do
      it 're-renders the "new_user_session" template' do
        @group = user.groups.first
        get :index, params: { group_id: @group.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'ユーザーがログインしている場合' do
      before do
        login_user user
        @group = user.groups.first
        get :index, params: { group_id: @group.id }
      end
        it 'assigns all groups as @groups' do
          groups = user.groups
          expect(assigns(:groups)).to match(groups)
        end
        it 'assigns all messages as @messages' do
          messages = @group.messages
          expect(assigns(:messages)).to match(messages)
        end

        it 'renders the :index template ' do
          expect(response).to render_template :index
        end
    end
  end

  describe 'POST #create' do

    context'ログインしていない場合' do
      it 're-renders the "new_user_session" template' do
        @group = user.groups.first
        post :create, params: { group_id: @group.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context'ユーザーがログインしている場合' do
      before do
        login_user user
        @group = user.groups.first
      end

      context 'with valid params' do
        let(:params) {{ message: attributes_for(:message), group_id: @group.id}}

        it 'creates a new message' do
          expect{
          post :create, params: params
        }.to change(Message, :count).by(1)
        end

        it 'assigns a newly created message as @message' do
          post :create, params: params
          expect(assigns(:message)).to be_a(Message)
          expect(assigns(:message)).to be_persisted
        end

        it 'redirects to the group_messages_path' do
          post :create, params: params
          expect(response).to redirect_to group_messages_path
        end

      end

      context 'with invalid params' do
        let(:params) {{ message: attributes_for(:message, { body: '', image: '' }), group_id: @group.id}}
        it 'assigns a newly created but unsaved user as @message' do
          expect {
              post :create, params: params
              }.to change(Message, :count).by(0)
        end
        it 're-renders the "index" template' do
          post :create, params: params
          expect(response).to render_template :index
        end
      end
    end
  end
end
