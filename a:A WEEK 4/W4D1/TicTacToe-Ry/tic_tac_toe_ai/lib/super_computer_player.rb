require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    @node = TicTacToeNode.new(game.board, mark)
    #if we can pick a move that wins
    @node.children.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
    end
    #if we can pick a move that isn't a losing move
    @node.children.each do |child|
      return child.prev_move_pos if !child.losing_node?(mark)
    end
    #all picks are losses
    raise "no non-losing nodes"

    #blocks winning move
    #return error if all upcoming moves  == lose

  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
