**# DB設計**


**## users table**


|   Column   |     Type     |             Options                    |
|:-----------|-------------:|:--------------------------------------:|
|    name    |    string    | index:true, null: false, unuque: true  |
|   email    |    string    | null: false, unuque: true              |

**## Association**
*### has_many :groups, through: members
*### has_many :messages
*### has_many :members

