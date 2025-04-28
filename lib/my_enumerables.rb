# frozen_string_literal: true

# Alter methods in Enumerable module
module Enumerable
  def my_each_with_index
    self.length.times do |i| # rubocop:disable Style/RedundantSelf
      yield self[i], i
    end
    self
  end

  def my_select
    new = self.class.new
    for item in self # rubocop:disable Style/For
      new << item if yield item
    end
    new
  end

  def my_all?
    for item in self # rubocop:disable Style/For
      return false unless yield item
    end
    true
  end

  def my_any?
    for item in self # rubocop:disable Style/For
      return true if yield item
    end
    false
  end

  def my_none?
    for item in self # rubocop:disable Style/For
      return false if yield item
    end
    true
  end

  def my_count
    result = 0
    for item in self # rubocop:disable Style/For
      return length unless block_given?

      result += 1 if yield item
    end
    result
  end

  def my_map
    new = self.class.new
    for item in self # rubocop:disable Style/For
      new << yield(item)
    end
    new
  end

  def my_inject(new)
    for item in self # rubocop:disable Style/For
      new = yield new, item
    end
    new
  end
end

# Used for my_each alone
class Array
  def my_each
    for item in self # rubocop:disable Style/For
      yield item
    end
  end
end
