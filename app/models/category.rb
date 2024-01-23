class Category < ActiveHash::Base
    self.data = [
        { id: 1, name: '---' },
        { id: 2, name: '趣味' },
        { id: 3, name: '雑談' },
        { id: 4, name: 'プログラミング' },
        { id: 5, name: 'テストメッセージ' }
    ]

    include ActiveHash::Associations
    has_many :posts
end