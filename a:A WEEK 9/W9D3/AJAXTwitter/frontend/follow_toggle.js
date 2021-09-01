class FollowToggle{
  // this.userId = el.data-user-id;
  // this.followState = el.intital-follow-state;
  constructor(el){
    this.$el = $(el);
    this.userId = this.$el.attr("data-user-id");
    this.followState = this.$el.attr("data-initial-follow-state");
    this.render();
  }
  render(){
    if (this.followState === "followed"){
    this.$el.text( "Unfollow!");
    }else{
    this.$el.text( "Follow!");
    }
  }

  handleClick(event){
    event.preventDefault();
    if (this.followState === "followed"){
      $.ajax({
        url: `/users/${this.userId}/follow`,
        method: "delete"
      }).then(()=>{this.followState = "unfollowed"})
      .then(this.render);
    }else{
      $.ajax({
        url: `/users/${this.userId}/follow`,
        method: "post"
      }).then(()=>{this.followState = "followed"})
      .then(this.render);
    } 
  }
}

// FollowToggle.prototype.render = function(){
//   if (this.followState === "followed"){
//     this.$el.innerText( "Unfollow!");
//   }else{
//     this.$el.innerText( "Follow!");
//   }
// }

// FollowToggle.prototype.handleClick = function (event){
//   event.preventDefault();
//   if (this.followState === "followed"){
//     $.ajax({
//       url: `/users/${this.otherUser.id}/follow`,
//       method: "delete"
//     }).then(()=>{this.followState = "unfollowed"})
//     .then(this.render);
//   }else{
//     $.ajax({
//       url: `/users/${this.otherUser.id}/follow`,
//       method: "post"
//     }).then(()=>{this.followState = "followed"})
//     .then(this.render);
//   }
// }



module.exports = FollowToggle;