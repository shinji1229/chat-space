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