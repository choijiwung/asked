오늘 한거

Ruby on rails 를 통한 CRUD 구현, 로그인 기능, artii 구현

```
1. rails g model(모델명)
route 가서 root 설정
root '모델명#index'
2. migration 파일 작성
rails g model 모델명 #(db)

db에 가서 migrate 파일 수정
3. rake db:migrate
  **rake db:drop 지워짐


```



1. controller : lotto
2. lotto#index : 루트페이지
3. lotto#index : 버튼(로또번호추천)
4. lotto#show : 로또번호추천



rails g controller lotto index show

index.erb : 

lotto_controller.rb : 로또 번호 추천 로직 넣기

-def show

- @lotto = 로또 추천코드

end

# def api 짜기

* 코드는 다음과 같습니다.

```ruby
require 'httparty'
require 'json'
    
response = HTTParty.get("http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=")
result = JSON.parse(response.body)

arr = Array.new

# for i in 0..6
#    arr << result["drwtNo#{i}"]
# end

#	6.times do |i|
#	arr << result["drwtNo#{i+1}"]
#	end

result.each do |key, value|
  if key.include? "drwtNo"
    arr << value
  end  
end

puts arr
  
```

- 공통의 리스트

```
lotto = [*1..45].sample(6)

 @matching = arr & lotto
 arr과 lotto에 공통으로 포함된 내용을
 
```



ruby 스크래핑



# 아스키아트

1. 사용자로부터 입력을 받는다.
2. 입력을 받은 것을 바탕으로 ascii art를 생성해주는 서비스를 만든다.



controller -> asciify -> action -> index,show

asciify#index -> 사용자의 input을 받는다.

->show로 넘겨준다.

asciify#show -> artii gem을 활용하여, 넘어온 input을 ascii art로 만들어 보여준다.

```ruby
gem 'artii'

#개발을 위해 항상 포함할 친구들
gem 'rails_db'
gem 'awesome_print'
gem 'pry-rails'

Gemfile 맨 마지막 end위에 추가하고 bundle install을 한다.
  

```

+ index.html

```
<h1>아스키 글자를 입력하세요</h1>
<form action = "asciify/show">
    <input type = "text" name = "content">
  <!--  <div>-->
  <!--  <h3>글자체 고르기</br></h3>-->
  <!--  <input type="radio" id="contactChoice1"-->
  <!--  name="option" value="standard" checked>-->
  <!--  <label for="contactChoice1">standard</label>-->

  <!--  <input type="radio" id="contactChoice2"-->
  <!--  name="option" value="big">-->
  <!--  <label for="contactChoice2">big</label>-->

  <!--  <input type="radio" id="contactChoice3"-->
  <!--  name="option" value="thin">-->
  <!--  <label for="contactChoice3">thin</label>-->
  <!--</div>-->
  <div>
 <select name = "option">
  <option value="standard">standard</option>
  <option value="big">big</option>
  <option value="thin">thin</option>
</select>
</div>
    <input type = "submit" value = "변환">
</form>


```



- asciify_controller.rb

```
 require 'artii'
 
class AsciifyController < ApplicationController
  
  def index
  end
  def show
    @content = params[:content]
    @option = params[:option]
    artii = Artii::Base.new(font: @option)
    
    @content = artii.asciify @content
  end
end
```

- 'standard','big','thin'



유저가 라우터 요청



show.erb : 로또 번호 추천 결과를 보여주기



Gemfile 을 통해서 이름 추가하고

bundle install



```
순서
rails g controller index show 
config/routes.rb에
root 추가

```





# Asked

```
1. question (질문자이름 , 내용)
- controller : question
- action : index,show
	-index.erb : form 질문을 받는다. (익명, 내이름을 쓸수도)
	-show : 입력된 질문을 보여준다.
- model : 
	-name(질문자이름)
	-content(내용)


```



```
회원가입

== Database 유저 정보를 저장하는 것

1. User 테이블 생성

- User model

1. User 정보를 저장

- 회원정보를 받아, DB에 저장

로그인

== session 유저 정보를 검증을 거친 후 저장하는 것

1. User 정보를 받는다.
2. 받은 User 정보와 DB의 User 정보가 일치하는지 확인
3. if 일치, session에 유저 정보를 넣는다.
   else, 이유를 말해주고 로그인 안시킨다.
4. 로그아웃
   session.clear


```







# Asked 코드

