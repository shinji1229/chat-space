# **DB設計**


## **users table**


|   Column   |     Type     |             Options                    |
|:-----------|-------------:|:--------------------------------------:|
|    name    |    string    | index:true, null: false, unique: true  |
|   email    |    string    | null: false, unique: true              |


<dl>
  <dt>Association</dt>
  <dd>has_many :groups, through: members</dd>
  <dd>has_many :messages</dd>
  <dd>has_many :members</dd>
</dl>


## **groups table**


|   Column   |     Type     |             Options                    |
|:-----------|-------------:|:--------------------------------------:|
|     name   |    string    | index:true, null: false                |


<dl>
  <dt>Association</dt>
  <dd>has_many :users, through: members</dd>
  <dd>has_many :messages</dd>
  <dd>has_many :members</dd>
</dl>


## **members table**


|   Column   |     Type     |             Options                    |
|:-----------|-------------:|:--------------------------------------:|
| user_id    |    integer   | foreign_key: true                      |
| group_id   |    integer   | foreign_key: true                      |


<dl>
  <dt>Association</dt>
  <dd>belongs_to :user</dd>
  <dd>belongs_to :group</dd>
</dl>

## **messages table**s


|   Column   |     Type     |             Options                    |
|:-----------|-------------:|:--------------------------------------:|
|   body     |    text      |                                        |
|   image    |    string    |                                        |
|   user_id  |    integer   | foreign_key: true                      |
|   group_id |    integer   | foreign_key: true                      |


<dl>
  <dt>Association</dt>
  <dd>belongs_to :user</dd>
  <dd>belongs_to :group</dd>
</dl>