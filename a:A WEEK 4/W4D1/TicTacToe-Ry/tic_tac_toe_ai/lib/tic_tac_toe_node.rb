require_relative 'tic_tac_toe.rb'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return false if self.board.over? && (self.board.winner == nil || self.board.winner == evaluator)
    return true if self.board.over?
    self.next_mover_mark == :x ? next_mark = :o : next_mark = :x
    if evaluator == self.next_mover_mark
      self.children.all? { |child| child.losing_node?(evaluator) }
    else
      self.children.any? { |child| child.losing_node?(next_mark) }
    end
    
  end

  def winning_node?(evaluator)
    return true if self.board.over? && self.board.winner == evaluator
    return false if self.board.over?

    self.next_mover_mark == :x ? next_mark = :o : next_mark = :x
    if evaluator == self.next_mover_mark
      self.children.any? { |child| child.winning_node?(evaluator) }
    else
      self.children.all? { |child| child.winning_node?(next_mark) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children

    # next_mark = self.board.players.keys.select { |key| key != self.next_mover_mark }
    children = []
    self.next_mover_mark == :x ? next_mark = :o : next_mark = :x
    (0...self.board.rows.length).each do |row|
      (0...self.board.rows.length).each do |col|
        if self.board.empty?([row,col])
          new_board = self.board.dup
          new_board[[row,col]] = self.next_mover_mark
          
          children << TicTacToeNode.new(new_board, next_mark, [row, col])
        end
      end
    end
    children

  end
end
