require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

module StarringSpecHelper

  def setup_users
    @user_one = User.create(:name => 'user one')
    @user_two = User.create(:name => 'user two')    
    User.current_user = @user_one
  end

  def setup_item
    @item = StarredItem.create(:name => 'an unstarred item')
  end

end

context "A new model which isn't starred" do

  include StarringSpecHelper

  setup do
    setup_users  
    setup_item
  end

  specify "should have no starrings" do
    @item.starrings.count.should_equal 0
  end
  
  specify "should not have been starred by either user" do
    @item.starred_by?(@user_one).should_be false
    @item.starred_by?(@user_two).should_be false    
  end
  
  specify "should have one starring by User.current_user after being starred" do
    # stars it as the current_user - @user_one in this case
    @item.star!
    @item.starrings.count.should_equal 1
    @item.starred_by?(@user_one).should_be true
    @item.starred_by?(@user_two).should_be false
  end

end

context "A model which is starred by a user" do

  include StarringSpecHelper

  setup do
    setup_users  
    setup_item
    @item.star!
  end
  
  specify "should have 1 starring" do
    @item.starrings.count.should_equal 1
  end
  
  specify "should be starred by @user_one" do
    @item.starred_by?(@user_one).should_be true
  end
  
  specify "should not have been starred by @user_two" do
    @item.starred_by?(@user_two).should_be false    
  end
  
  specify "should not have been starred by anyone after calling unstar!" do
    @item.unstar!
    @item.starred_by?(@user_one).should_be false
    @item.starred_by?(@user_two).should_be false    
    @item.starrings.count.should_equal 0    
  end
  
end
