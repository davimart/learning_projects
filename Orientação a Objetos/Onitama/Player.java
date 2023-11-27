/**
 * Classe que contém informações e ações básicas relacionadas aos jogadores
 */
public class Player {
  private String name;
  private Color pieceColor;
  private Card[] cards = new Card[2];
  private Piece[] pieces = new Piece[5]; //Decidimos associar as peças aos jogadores

  /**
   * Construtor que define informações básicas do jogador
   * 
   * @param name       Nome do jogador
   * @param pieceColor Cor das peças do jogador
   * @param cards      Cartas na mão do jogador
   */
  public Player(String name, Color pieceColor, Card[] cards) {
    this(name, pieceColor, cards[0], cards[1]);
  }

  /**
   * Construtor que define informações básicas do jogador
   * 
   * @param name       Nome do jogador
   * @param pieceColor Cor das peças do jogador
   * @param card1      A primeira carta na mão do jogador
   * @param card2      A segunda carta na mão do jogador
   */
  public Player(String name, Color pieceColor, Card card1, Card card2) {
    this.name = name;
    this.pieceColor = pieceColor;
    this.cards[0] = card1;
    this.cards[1] = card2;
  }

  /**
   * Construtor que define informações básicas do jogador
   * 
   * @param name       Nome do jogador
   * @param pieceColor Cor das peças do jogador
   * @param card1      A primeira carta na mão do jogador
   * @param card2      A segunda carta na mão do jogador
   
   !!! Decidimos associar as peças aos jogadores !!!
   * @param pieces     Vetor de peças do jogador
   */

  public Player(String name, Color pieceColor, Card card1, Card card2, Piece[] pieces) {
    this(name, pieceColor, card1, card2);
    this.pieces = pieces;  
  }


   public Piece[] getPieces() {
    return this.pieces;
  }


  /**
   * Método que devolve o nome do jogador(a)
   * 
   * @return String com o nome do jogador(a)
   */
  public String getName() {
    return this.name;
  }

  /**
   * Método que devolve a cor das peças do jogador
   * 
   * @return Enum Color com a cor das peças do jogador
   */
  public Color getPieceColor() {
    return this.pieceColor;
  }

  /**
   * Método que devolve as cartas da mão do jogador
   * 
   * @return Booleano true para caso seja um mestre e false caso contrário
   */
  public Card[] getCards() {
    return this.cards;
  }

  /**
   * Método que troca uma carta da mão por outra carta (idealmente da mesa)
   * 
   * @param oldCard A carta que será substituída
   * @param newCard A carta que irá substituir
   * @exception InvalidCardException Caso a carta não esteja na mão do jogador
   *                                 e/ou na mesa
   */
  protected void swapCard(Card oldCard, Card tableCard) throws InvalidCardException {
     
    if (this.cards[0] == oldCard) {
      this.cards[0] = tableCard;
    } else if (this.cards[1] == oldCard) {
      this.cards[1] = tableCard;
    } else {
      throw new InvalidCardException("Carta não está na mão do jogador");
    }

  }
}
