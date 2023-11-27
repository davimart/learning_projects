/**
 * Classe que contém informações das peças de jogo
 */
public class Piece {
    private Color color;
    private boolean isMaster, isAlive;
    //Decidimos adicionar posição a peças também e ter essa redundância
    private Position position;
    /**
     * Construtor que define a cor e o tipo da peça
     * @param color Cor da peça
     * @param isMaster Se o tipo da peça é mestre ou não
     */
    public Piece(Color color, boolean isMaster) {
      this.color = color;
      this.isMaster = isMaster;
      this.isAlive = true;
    }

  public Piece(Color color, boolean isMaster, Position position) {
      this.color = color;
      this.isMaster = isMaster;
      this.isAlive = true;
      this.position = position;
    }

    public Position getPosition(){
      return this.position;
    }

    public void setPosition(Position position){
      this.position = position;
    }

    /**
     * Método que devolve a cor da peça
     * @return Enum Color com a cor da peça
     */
    public Color getColor() {
        return this.color;
    }

    /**
     * Método que devolve se é um mestre ou não
     * @return Booleano true para caso seja um mestre e false caso contrário
     */
    public boolean isMaster() {
        return this.isMaster;
    }

  /**
  Entendemos que esse método foi removido, mas queriamos utiliza lo então adicionamos como um método nosso
  **/
    public boolean isAlive(){
      return this.isAlive;
    }
  /**
  Método que muda o valor isAlive
  **/
    public void killPiece(){
      this.isAlive = false;
    }
}
