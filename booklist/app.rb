require 'sinatra'
require 'mysql2'

get '/' do
  client = Mysql2::Client.new(host:'localhost', username:'root', database:'booklist', encoding:'utf8')
  @records = client.query("SELECT * FROM books ORDER BY created_at DESC")
  erb :booklist
end

post '/' do
  client = Mysql2::Client.new(host:'localhost',username:'root',database:'booklist',encoding:'utf8')
  #書籍タイトルの保存
  book_title = params['book_title']
  statement = client.prepare('insert into books (book_title) values(?)')
  statement.exective(book_title)
  
  @record = clinet.query("select * from books order by created_at desc")
  
  erb :booklist
end
