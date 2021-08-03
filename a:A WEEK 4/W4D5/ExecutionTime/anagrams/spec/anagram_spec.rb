
require "anagram"


describe "first_anagram?" do
  it "two given words are anagrams if the letters in one word can be rearranged to form the other word" do
    expect(first_anagram?("gizmo", "sally")).to be(false)
    expect(first_anagram?("elvis", "lives")).to be(true)
    expect(first_anagram?("abcd", "abdd")).to be(false)
    expect(first_anagram?("dabc", "abcd")).to be(true)
    expect(first_anagram?("dfa", "jfda")).to be(false)
    expect(first_anagram?("act", "cat")).to be(true)
    expect(first_anagram?("kfajsnx8", "kfajsnxz")).to be(false)
    expect(first_anagram?("athens", "hasten")).to be(true)
  end
end



describe "second_anagram?" do
  it "two given words are anagrams if the letters in one word can be rearranged to form the other word" do
    expect(second_anagram?("gizmo", "sally")).to be(false)
    expect(second_anagram?("elvis", "lives")).to be(true)
    expect(second_anagram?("abcd", "abdd")).to be(false)
    expect(second_anagram?("dabc", "abcd")).to be(true)
    expect(second_anagram?("dfa", "jfda")).to be(false)
    expect(second_anagram?("act", "cat")).to be(true)
    expect(second_anagram?("kfajsnx8", "kfajsnxz")).to be(false)
    expect(second_anagram?("athens", "hasten")).to be(true)
  end
end



describe "third_anagram?" do
  it "two given words are anagrams if the letters in one word can be rearranged to form the other word" do
    expect(third_anagram?("gizmo", "sally")).to be(false)
    expect(third_anagram?("elvis", "lives")).to be(true)
    expect(third_anagram?("abcd", "abdd")).to be(false)
    expect(third_anagram?("dabc", "abcd")).to be(true)
    expect(third_anagram?("dfa", "jfda")).to be(false)
    expect(third_anagram?("act", "cat")).to be(true)
    expect(third_anagram?("kfajsnx8", "kfajsnxz")).to be(false)
    expect(third_anagram?("athens", "hasten")).to be(true)
  end
end




describe "fourth_anagram?" do
  it "two given words are anagrams if the letters in one word can be rearranged to form the other word" do
    expect(fourth_anagram?("gizmo", "sally")).to be(false)
    expect(fourth_anagram?("elvis", "lives")).to be(true)
    expect(fourth_anagram?("abcd", "abdd")).to be(false)
    expect(fourth_anagram?("dabc", "abcd")).to be(true)
    expect(fourth_anagram?("dfa", "jfda")).to be(false)
    expect(fourth_anagram?("act", "cat")).to be(true)
    expect(fourth_anagram?("kfajsnx8", "kfajsnxz")).to be(false)
    expect(fourth_anagram?("athens", "hasten")).to be(true)
  end
end
