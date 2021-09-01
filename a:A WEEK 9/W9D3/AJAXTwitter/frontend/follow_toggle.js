function FollowToggle(el){
  this.userId = el.user-id;
  this.followState = el.intital-follow-state;
  this.$el = $(el);
  this.render()
}

FollowToggle.prototype.render = function (){
  if (this.followState === "followed"){
    this.$el.innerText( "Unfollow!");
  }else{
    this.$el.innerText( "Follow!");
  }
}

FollowToggle.prototype.handleClick = function (event){
  event.preventDefault();
  if (this.followState === "followed"){
    $.ajax({
      url: "/users/:id/follow",
      method: "post",
      
    })
  }else{

  }
}


module.exports = FollowToggle;