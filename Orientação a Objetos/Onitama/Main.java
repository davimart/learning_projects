import java.util.Scanner; 

public class Main {
    public static void main(String[] args) {
 
        System.out.println("Onitama!!!");

      GameImpl game = new GameImpl();


      int xPeca, yPeca, carta, xMov, yMov;
      Scanner ler = new Scanner(System.in);

      Player currentPlayer = game.red_player;
      
      
      game.printGame();
      game.printBoard2();
      while(game.checkVictory(Color.BLUE) != true && game.checkVictory(Color.RED) != true){
        
        System.out.println("Insira a linha da peça: ");
        xPeca = ler.nextInt();
        System.out.println("Insira a coluna da peça: ");
        yPeca = ler.nextInt();
        
        System.out.println("Insira a carta(0 ou 1): ");
        carta = ler.nextInt();
        
        System.out.println("Insira a linha do movimento: ");
        xMov = ler.nextInt();
        System.out.println("Insira a coluna do movimento: ");
        yMov = ler.nextInt();

        game.makeMove(currentPlayer.getCards()[carta], new Position(xMov, yMov), new Position(xPeca, yPeca)); 

        game.printGame();
        game.printBoard2();

        if(currentPlayer == game.red_player)
          currentPlayer = game.blue_player;
        else
          currentPlayer = game.red_player;
      }      
    }  
}