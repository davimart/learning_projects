import java.util.Random;
import java.util.ArrayList;
public class GameImpl implements Game {
    private Card tableCard;
    private Spot[][] board = new Spot[5][5];
    public Player red_player, blue_player;
    private Card[] game_deck = new Card[5];
    private Color turn = Color.RED;
    
  
    public GameImpl(){
      this("Red Player", "Blue Player");  
    }

    public GameImpl(String redPlayer, String bluePlayer){
      this(redPlayer, bluePlayer, Card.createCards());  
    }

    public GameImpl(String redPlayer, String bluePlayer, Card[] cards){
      
    //Embaralhando
    ArrayList<Integer> shuffle = new ArrayList<>();
    
    int i= 0;
    while (shuffle.size() < 5){
      Random random = new Random();
      int aux = random.nextInt(cards.length);
      if (!shuffle.contains(aux)) {
        shuffle.add(aux);
        game_deck[i] = cards[aux];
        i++;
      }        
    }
    
    
    
    //criando as peças dos jogadores
    Piece[] red_pieces = new Piece[5];
    Piece[] blue_pieces = new Piece[5];
    
    //Criando o tabuleiro
    for (int j = 0; j < 5; j++) {
      //se é a peça/posição é o mestre
      if(j==2){
      red_pieces[j] = new Piece(Color.RED, true, new Position(4,j));
      blue_pieces[j] = new Piece(Color.BLUE, true, new Position(0,j));
      this.board[4][j] = new Spot(red_pieces[j], new Position(4,j), Color.RED);
      this.board[0][j] = new Spot(blue_pieces[j], new Position(0,j), Color.BLUE);
        
      }else{
      red_pieces[j] = new Piece(Color.RED, false, new Position(4,j));
      blue_pieces[j] = new Piece(Color.BLUE, false, new Position(0,j));
      this.board[4][j] = new Spot(red_pieces[j], new Position(4,j), Color.NONE);
      this.board[0][j] = new Spot(blue_pieces[j], new Position(0,j), Color.NONE);
      }
    }

    for (i = 1; i < 4; i++) {
      for (int j = 0; j < 5; j++) {
        this.board[i][j] = new Spot(new Position(i,j));
      }
    }
    
    //Criando Jogadores
    //Associação entre peça e jogador criada por nós
    this.red_player = new Player(redPlayer, Color.RED, game_deck[0], game_deck[1], red_pieces);
    this.blue_player = new Player(bluePlayer, Color.BLUE, game_deck[2], game_deck[3], blue_pieces);
    this.tableCard = this.game_deck[4];
  }

  
    /**
     * Método que devolve a cor da posição do tabuleiro. Se possui uma cor, significa que é um templo. Caso contrário, é um espaço normal
     * @param position Posição do tabuleiro
     * @return O enum Color que representa a cor da posição
     */
    public Color getSpotColor(Position position){
      return this.board[position.getRow()][position.getCol()].getColor();
    }

    /**
     * Método que devolve a peça que está na posição do tabuleiro
     * @param position Posição do tabuleiro
     * @return Um objeto Piece que representa a peça na posição indicada. Se não tiver peça, devolve null
     */
    public Piece getPiece(Position position){
      return this.board[position.getRow()][position.getCol()].getPiece();
    }

    /**
     * Método que devolve a carta que está na mesa, que será substituída após a próxima jogada
     * @return Um objeto Card que representa a carta na mesa
     */
    public Card getTableCard(){
      return this.tableCard;
    }

    /**
     * Método que devolve as informações sobre o jogador com as peças vermelhas
     * @return Um objeto Player que representa o jogador vermelho
     */
    public Player getRedPlayer(){
      return this.red_player;
    }

    /**
     * Método que devolve as informações sobre o jogador com as peças azuis
     * @return Um objeto Player que representa o jogador azul
     */
    public Player getBluePlayer(){
      return this.blue_player;
    }
    /**
     * Método que move uma peça
     * @param piece A peça que irá mover
     * @param card A carta de movimento que será usada
     * @param position A posição da carta para onde a peça irá se mover
     * @exception IncorrectTurnOrderException Caso não seja a vez de um jogador fazer um movimento
     * @exception IllegalMovementException Caso uma peça seja movida para fora do tabuleiro ou para uma posição onde já tem uma peça da mesma cor
     * @exception InvalidCardException Caso uma carta que não está na mão do jogador seja usada
     * @exception InvalidPieceException Caso uma peça que não está no tabuleiro seja usada
     */
  
        public void makeMove(Card card, Position cardMove, Position currentPos) throws IncorrectTurnOrderException, IllegalMovementException, InvalidCardException,InvalidPieceException{
      //Sinceramente com alteração do método parte das exceções ficaram um pouco estranhas de acordo com a descrição original
               
      //Verificando se há uma peça na posição indicada
      if(getPiece(currentPos) == null){
        throw new InvalidPieceException ("Não tem uma peça na posição");
      }

      //Verificando se jogador está tentando mover peça do oponente
      Piece piece;
      piece = getPiece(currentPos);
      if (this.turn != piece.getColor()){
        throw new InvalidPieceException("Jogador tentou mover peça do oponente");
      }
      
      //Verificação se o jogador do turno tem a carta
      Card[] player_cards;
      if(this.turn == Color.RED){
        player_cards = this.red_player.getCards();
      }else{
        player_cards = this.blue_player.getCards();
      }  
      if(player_cards[0]!= card && player_cards[1]!= card){
        throw new InvalidCardException("Esta carta não está na mão do jogador");
      }

      //Verificando se o movimento condiz com a carta escolhida
      boolean flag = false;
      for(Position i : card.getPositions()){
        if(turn == Color.BLUE){
          if(currentPos.getRow() - i.getRow() == cardMove.getRow() && currentPos.getCol() - i.getCol() == cardMove.getCol())
            flag = true;
        }else{
          if(currentPos.getRow() + i.getRow() == cardMove.getRow() && currentPos.getCol() + i.getCol() == cardMove.getCol())
            flag = true;
        }     
      }
      if(!flag){
        throw new IllegalMovementException("Movimento não compatível com a carta.");
      }
      
    //Verificação se a peça está sendo movida para fora do tabuleiro
      if(cardMove.getRow() < 0 || cardMove.getRow() >= 5 || cardMove.getCol() < 0 || cardMove.getCol() >= 5){
        throw new IllegalMovementException ("Tentou mover peça para fora do tabuleiro");
      }

      Spot card_spot;
      card_spot = this.board[cardMove.getRow()][cardMove.getCol()];    
      
      /**Esse método:
        - lança a exceção IllegalMovementException se a movimentação da peça é para uma posição onde já tem uma peça da mesma cor
        - muda as informações dos spots
        - mata uma peça de outra cor se for o caso
      **/
      try{
        card_spot.occupySpot(piece);
      } catch(IllegalMovementException e){
        throw e;        
      }
      
      //Agora que não tem mais exceções, fazer as alterações necessárias
      
      //Liberar o espaço
      card_spot = this.board[currentPos.getRow()][currentPos.getCol()];      
      card_spot.releaseSpot();
      
      //Mudar a posição da peça - uma redundância escolhida
      piece.setPosition(cardMove);

      //Trocar as cartas
      if(this.turn == Color.RED){
        red_player.swapCard(card, this.tableCard);
      }else{
        blue_player.swapCard(card, this.tableCard);
      }
      this.tableCard = card;
      
      //Trocar o turno
      if(this.turn == Color.RED){
        this.turn = Color.BLUE;
      }else{
        this.turn = Color.RED;
      }
    }

    /**
     * Método que confere se um jogador de uma determinada cor venceu o jogo. Critérios de vitória:
     * — Derrotou a peça de mestre adversária
     * — Posicionou o seu mestre na posição da base adversária
     * @param color Cor das peças do jogador que confere a condição de vitória
     * @return Um booleano true para caso esteja em condições de vencer e false caso contrário
     */

    public boolean checkVictory(Color color){
      Piece[] jogador, oponente;
      Position aux;

      //Caso seja o jogador vermelho
      if(color==Color.RED){
        //Associação entre peça e jogador criada por nós
        jogador = red_player.getPieces();
        oponente = blue_player.getPieces();

        //Se o mestre ocupa o Templo adversário
        aux = jogador[2].getPosition();
        if(aux.getRow() == 0 && aux.getCol() == 2){
          return true;
        }

      //Caso seja o jogador azul  
      }else{
        jogador = blue_player.getPieces();
        oponente = red_player.getPieces();

        aux = jogador[2].getPosition();
        if(aux.getRow() == 4 && aux.getCol() == 2){
          return true;
        }
      }
      //Se o mestre do oponente está vivo ou morto - do método que escolhemos manter
      if(oponente[2].isAlive()){
        return false;
      }else{
        return true;
      }
    }

    /**
     * Método que imprime o tabuleiro no seu estado atual
     * OBS: Esse método é opcional não será utilizado na correção, mas serve para acompanhar os resultados parciais do jogo
     */

   public void printBoard(){

    for(int i = 0; i < 5; i++){
      System.out.print(board[i][0].getColor() + " " + board[i][0].getPiece() + " " + board[i][0].getPosition().getRow() + " " + board[i][0].getPosition().getCol() + "|");
      System.out.print(board[i][1].getColor() + " " + board[i][1].getPiece() + " " + board[i][1].getPosition().getRow() + " " +  board[i][1].getPosition().getCol() + "|");
      System.out.print(board[i][2].getColor() + " " + board[i][2].getPiece() + " " + board[i][2].getPosition().getRow() + " " + board[i][2].getPosition().getCol() + "|");
      System.out.print(board[i][3].getColor() + " " + board[i][3].getPiece() + " " + board[i][3].getPosition().getRow() + " " + board[i][3].getPosition().getCol() + "|");
      System.out.println(board[i][4].getColor() + " " + board[i][4].getPiece() + " " + board[i][4].getPosition().getRow() + " " + board[i][4].getPosition().getCol()  + "|");
    }
    
   }

  /* private Card tableCard;
    private Spot[][] board = new Spot[5][5];
    private Player red_player, blue_player;
    private Card[] game_deck = new Card[5];
    private Color turn = Color.RED; */
     
  public void printGame(){
    System.out.println("Jogador vermelho: " + this.red_player.getName());
    System.out.println("Jogador azul: " + this.blue_player.getName());
    System.out.println("Table card: " + tableCard.getName());
    System.out.println("Cartas do vermelho: " + red_player.getCards()[0].getName() +" e "+  red_player.getCards()[1].getName());
    System.out.println("Cartas do azul: " + blue_player.getCards()[0].getName()+ " e " + blue_player.getCards()[1].getName());
    System.out.println("Turno atual: " + turn);
  }



public void printBoard2(){
  
    System.out.println("---------------");
    for(int i = 0; i < 5; i++){
      
      for(int j = 0; j <5; j++){
        if(board[i][j].getPiece()!= null){
          if(board[i][j].getPiece().getColor() == Color.BLUE){
            if(board[i][j].getPiece().isMaster()){
              System.out.print(" B ");
            }else{
            System.out.print(" b ");
            }
          } else if(board[i][j].getPiece().getColor() == Color.RED){
            if(board[i][j].getPiece().isMaster()){
              System.out.print(" R ");
            }else {
            System.out.print(" r ");
            }
          }
        }else{
          System.out.print("---");
        }
        }

        System.out.println("");
    }
    System.out.println("---------------");
}
}