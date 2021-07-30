
require "two_sum"

describe "brute_two_sum?" do
  it "determine whether any two integers in the array sum to that amount." do
    # true tests
    expect(brute_two_sum?([0, 1, 5, 7], 6)).to be(true)
    expect(brute_two_sum?([0, 1, 5, 7], 8)).to be(true)
    expect(brute_two_sum?([0, 1, 5, 7], 1)).to be(true)
    expect(brute_two_sum?([0, 1, 5, 7], 5)).to be(true)
    expect(brute_two_sum?([0, 1, 5, 7], 7)).to be(true)
    expect(brute_two_sum?([4, 5, 1, 8], 6)).to be(true)
    expect(brute_two_sum?([4, 5, 1, 8], 9)).to be(true)
    expect(brute_two_sum?([4, 5, 1, 8], 13)).to be(true)
    expect(brute_two_sum?([4, 5, 1, 8], 5)).to be(true)
    expect(brute_two_sum?([4, 5, 1, 8], 12)).to be(true)

    # false tests
    expect(brute_two_sum?([4, 5, 1, 8], 0)).to be(false)
    expect(brute_two_sum?([0, 1, 5, 7], 10)).to be(false)
    expect(brute_two_sum?([4, 5, 1, 8], -1)).to be(false)
    expect(brute_two_sum?([4, 5, 1, 8], 2)).to be(false)
    expect(brute_two_sum?([4, 5, 1, 8], 3)).to be(false)
    expect(brute_two_sum?([4, 5, 1, 8], 1)).to be(false)
    expect(brute_two_sum?([4, 5, 1, 8], 4)).to be(false)
    expect(brute_two_sum?([4, 5, 1, 8], 7)).to be(false)
    expect(brute_two_sum?([4, 5, 1, 8], 8)).to be(false)
  end
end


describe "sorting_two_sum?" do
  it "determine whether any two integers in the array sum to that amount." do
    # true tests
    expect(sorting_two_sum?([0, 1, 5, 7], 6)).to be(true)
    expect(sorting_two_sum?([0, 1, 5, 7], 8)).to be(true)
    expect(sorting_two_sum?([0, 1, 5, 7], 1)).to be(true)
    expect(sorting_two_sum?([0, 1, 5, 7], 5)).to be(true)
    expect(sorting_two_sum?([0, 1, 5, 7], 7)).to be(true)
    expect(sorting_two_sum?([4, 5, 1, 8], 6)).to be(true)
    expect(sorting_two_sum?([4, 5, 1, 8], 9)).to be(true)
    expect(sorting_two_sum?([4, 5, 1, 8], 13)).to be(true)
    expect(sorting_two_sum?([4, 5, 1, 8], 5)).to be(true)
    expect(sorting_two_sum?([4, 5, 1, 8], 12)).to be(true)

    # false tests
    expect(sorting_two_sum?([4, 5, 1, 8], 0)).to be(false)
    expect(sorting_two_sum?([0, 1, 5, 7], 10)).to be(false)
    expect(sorting_two_sum?([4, 5, 1, 8], -1)).to be(false)
    expect(sorting_two_sum?([4, 5, 1, 8], 2)).to be(false)
    expect(sorting_two_sum?([4, 5, 1, 8], 3)).to be(false)
    expect(sorting_two_sum?([4, 5, 1, 8], 1)).to be(false)
    expect(sorting_two_sum?([4, 5, 1, 8], 4)).to be(false)
    expect(sorting_two_sum?([4, 5, 1, 8], 7)).to be(false)
    expect(sorting_two_sum?([4, 5, 1, 8], 8)).to be(false)
  end
end


describe "hash_two_sum?" do
  it "determine whether any two integers in the array sum to that amount." do
    # true tests
    expect(hash_two_sum?([0, 1, 5, 7], 6)).to be(true)
    expect(hash_two_sum?([0, 1, 5, 7], 8)).to be(true)
    expect(hash_two_sum?([0, 1, 5, 7], 1)).to be(true)
    expect(hash_two_sum?([0, 1, 5, 7], 5)).to be(true)
    expect(hash_two_sum?([0, 1, 5, 7], 7)).to be(true)
    expect(hash_two_sum?([4, 5, 1, 8], 6)).to be(true)
    expect(hash_two_sum?([4, 5, 1, 8], 9)).to be(true)
    expect(hash_two_sum?([4, 5, 1, 8], 13)).to be(true)
    expect(hash_two_sum?([4, 5, 1, 8], 5)).to be(true)
    expect(hash_two_sum?([4, 5, 1, 8], 12)).to be(true)

    # false tests
    expect(hash_two_sum?([4, 5, 1, 8], 0)).to be(false)
    expect(hash_two_sum?([0, 1, 5, 7], 10)).to be(false)
    expect(hash_two_sum?([4, 5, 1, 8], -1)).to be(false)
    expect(hash_two_sum?([4, 5, 1, 8], 2)).to be(false)
    expect(hash_two_sum?([4, 5, 1, 8], 3)).to be(false)
    expect(hash_two_sum?([4, 5, 1, 8], 1)).to be(false)
    expect(hash_two_sum?([4, 5, 1, 8], 4)).to be(false)
    expect(hash_two_sum?([4, 5, 1, 8], 7)).to be(false)
    expect(hash_two_sum?([4, 5, 1, 8], 8)).to be(false)
  end
end