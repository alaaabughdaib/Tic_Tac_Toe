import 'dart:io';

void main() {
  while (true) {
    playGame();
    print("Do you want to play again? (yes/no): ");
    String playAgain = stdin.readLineSync()!.toLowerCase();
    if (playAgain != 'yes') {
      break;
    }
  }
}

void playGame() {
  int currentPlayer = 0; // 0 is X and 1 is O
  int count = 0; // count of moves

  print("Tic Tac Toe\n");

  var board =
      List<List<String>>.generate(3, (i) => List<String>.filled(3, "* "));
  for (var row in board) {
    print(row.join());
  }

  bool checkWin() {
    // Check rows, columns, and diagonals
    for (var i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0] != "* ") {
        return true; // Check rows
      }
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i] != "* ") {
        return true; // Check columns
      }
    }

    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0] != "* ") {
      return true; // Check diagonal
    }

    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2] != "* ") {
      return true; // Check diagonal
    }

    return false;
  }

  void printBoard(List<List<String>> board) {
    for (var row in board) {
      print(row.join());
    }
  }

  while (count < 9 && !checkWin()) {
    print("Enter the row (0, 1, or 2): ");
    int row = int.parse(stdin.readLineSync()!);
    print("Enter the column (0, 1, or 2): ");
    int col = int.parse(stdin.readLineSync()!);

    if (row >= 0 && row < 3 && col >= 0 && col < 3 && board[row][col] == "* ") {
      count++;
      board[row][col] = currentPlayer == 0 ? "X " : "O ";
      printBoard(board);
      currentPlayer = (currentPlayer == 0) ? 1 : 0;
    } else {
      print("Invalid move. Try again.");
    }
  }

  if (checkWin()) {
    print("Player ${currentPlayer == 0 ? 'O' : 'X'} wins!");
  } else {
    print("It's a draw!");
  }
}
