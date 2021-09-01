const FollowToggle = require("./follow_toggle");

$(()=>{
  $("button.follow-toggle").each((idx, ele) => {
      FollowToggle(ele);
  })
})