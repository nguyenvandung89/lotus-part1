##1. Lotus là gì
- Lotus là một web framework, sử dụng ngôn ngữ Ruby, nó vẫn đang trong giai đoạn phát triển, nó có cấu trúc đơn giản và được thiết kế giúp người dùng dễ dàng phân cách concern
- Lotus có điểm hạn chế đó là kho dữ liệu hay là các topic hỗ trợ ít vì nó là framework mới cho nên cộng đồng chưa được đông, hơn nữa là nó chưa hoàn thiện cho nên một số tính năng chưa được mượt
- Do lotus được viết bằng ruby, nên đa phần sẽ sử dụng được ruby gem, nhưng sẽ không sử dụng được rails gem

##2. Cài đặt
###2.1 Require
 - Hệ điều hành: Linux hoặc MacOS, có thể với window(ít)
 - Database: Mysqlite, postgresql hay mysql ...
 - Git: Để thao tác với command dễ dàng hơn
 - Terminal, web browser và text editor ...

###2.2 Cài đặt
- Cài đặt lotus rất đơn giản chỉ cần chạy 1 lệnh sau
```gem install lotusrb```![image1.png](/uploads/images/64e1fad9126db41c667e421ebb274919929ba458/3de9d299b9e11424fc88ed66c52af92dea7a5d32.png) 

- Hiện tại thì phiên bản mới nhất là 0.5.1
- Sau khi cài đặt xong thì chạy lệnh
```lotus new ten_app```

 - Ví dụ:
```lotus new lotus_part1```
![image2.png](/uploads/images/64e1fad9126db41c667e421ebb274919929ba458/89a1742d22ba32571ed7e05c038463e2536708e2.png) 
- Hình ảnh dưới đây là cấu trúc thư mục của 1 app lotus![image3.png](/uploads/images/64e1fad9126db41c667e421ebb274919929ba458/4eabd7e767fad25d56695f2ffa6948ae4ba2a0b3.png) 

- Thư mục apps: 

 - Một appplication trong lotus có thể chứa nhiều các web apps ở trong, kiểu như các folder namespace của rails.
Với cách tổ chức như này thì nó giúp chúng ta có thể mở rộng code dễ dàng hơn rất nhiều so với rails(kiến trúc micro-services) kiểu như code của bạn càng lúc càng phình ra và cần phải scale nhiều thì ta chỉ cần copy các app folder sang một apps khác, mạc định khi khởi tạo new app thì lotus sẽ tạo ra 1 web app đâu tiên tên là web
- Thư mục lib: 

 - Khác với Rails, lib sẽ là nơi chứa các business logic của bạn, kể cả model

- Các file .env, .env.development, .env.test

 - Trong Rails thường dùng các file *.yml để config, còn lotus rất ít khi sử dụng *.yml. Nếu ở Rails bạn có file database.yml để cấu hình database thì ở lotus sẽ không có. Thay vào đó ta sử dụng database url và đặt trong các file .env tương ứng với từng environment. Ví dụ .env.test là các biến environment sẽ được export khi chạy ở môi trường test

###2.3 Nhận xét
- Lotus được phát triển sau Rails, do đó đã nhìn thấy và khắc phục được một vài nhược điểm của Rails. Một trong những điểm mới được cộng đồng đánh giá rất tích cực đó là:
 - Lotus::Action, bây giờ mỗi action sẽ tương ứng với một class chứ không còn là một method giống như bên Rails nữa. Điều này sẽ giúp các bạn tránh khỏi những controller rất là bự, với nhiều action(ví dụ như create, update, new, edit ... trong 1 controller) hơn nó chức năng này làm cho việc testing trở nên đơn giản hơn.

   Ví dụ:
   - Ta có 2 action index và show thì trong lotus sẽ tạo ra 2 file là index.rb và show.rb khác với rails
   ```Ruby
module Web::Controllers::Users
  class Index
    include Web::Action
    expose :users
    def call(params)
      @users = UserRepository.all
    end
  end
end
```
 ```Ruby
module Web::Controllers::Users
  class Show
    include Web::Action
    expose :user
    def call(params)
      @user = UserRepository.find params[:id]
    end
  end
end
```
 - Còn về test thì rất đơn giản đó là mỗi action sẽ tạo ra một file test tương ứng
 ```Ruby
require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/index'
describe Web::Controllers::Users::Index do
  let(:action) { Web::Controllers::Users::Index.new }
  let(:params) { Hash[] }
  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
```
đoạn code này dùng để test action index của users controller

- View và Template: ở Rails, view và template được gộp vào làm một vì vậy đổi khi chúng ta sẽ thấy trên view của rails có sử dụng bussinis logic và rails dùng view helper để khắc phục vấn đề này nhưng vẫn chưa phải là giải pháp được đánh giá cao. Với Lotus, view là một class và tất cả các methods của class sẽ available trong template. Có thể nói view class như là một presentor, còn template sẽ chỉ có một nhiệm vụ duy nhất đó là hiển thị nội dung, sẽ không có câu bussinis logic nào nằm trong template nữa, và khi viết test cũng rất sáng sủa

 - Ví dụ về template và view
    ta có 1 view index.rb sau
 ```Ruby
module Web::Views::Top
  class Index
    include Web::View
    def header
      html.h2 "Hello"
    end
  end
end
```
 và file template sau index.html.erb
```Ruby
<p>The First</p>
<%= header %>
```
ở trong template này đã gọi đến hàm header trong file view và show nó lên
![image7.png](/uploads/images/64e1fad9126db41c667e421ebb274919929ba458/b0eba0a2c1ff15ba6e62de18590e4ba41c55c041.png) 

- Lotus cũng cung cấp một vài command giúp generate nhanh chóng như Rails.

 ```lotus generate action web-application-name controller-name#action-name```
 
- Ví dụ như tạo 1 action mới dùng lệnh như sau

   ```lotus generate action web top#index```

  sau khi chạy lệnh trên nó sẽ auto render ra cho mình các file sau
  ![image4.png](/uploads/images/64e1fad9126db41c667e421ebb274919929ba458/5bdc8a45661835ea503d9aa066bbfa36d58dc5aa.png) 
  
   - Add thêm một path nữa vào router
   - Tạo action class và spec tương ứng
   - Tạo view class và spec tương ứng
   - Tạo template file

- Nếu không muốn sử dụng erb mà muốn sử dụng haml, slim, hay các định dạng khác, thì chúng ta chỉ cần install gem tương ứng, sau đó mở file: .lotusrc, chỉnh lại value cho template, ví dụ:
```ruby
architecture=container
test=rspec
template=slim
```
```ruby
architecture=container
test=rspec
template=erb
```
#### [Tài liệu tham khảo](http://lotusrb.org/guides/getting-started/)
#### Source code [Tại đây](https://github.com/nguyenvandung89/lotus-part1)


