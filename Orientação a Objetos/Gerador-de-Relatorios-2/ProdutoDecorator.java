//Arquivo que implementa Decorators para o objeto Produto
//Utilizado na estilização de fontes CSS durante a impressão do relatório

abstract class ProdutoDecorator implements Produto {
	protected Produto ProdutoDecorado;

	public ProdutoDecorator(Produto ProdutoDecorado) {
		this.ProdutoDecorado = ProdutoDecorado;
	}

  public void setQtdEstoque(int qtdEstoque){
    this.ProdutoDecorado.setQtdEstoque(qtdEstoque);
  }
	public void setPreco(double preco){
    this.ProdutoDecorado.setPreco(preco);
  }
  
	public int getId(){
    return this.ProdutoDecorado.getId();
  }
	public String getDescricao(){
    return this.ProdutoDecorado.getDescricao();
  }
	public String getCategoria(){
     return this.ProdutoDecorado.getCategoria();
  }
	public int getQtdEstoque(){
    return this.ProdutoDecorado.getQtdEstoque();
  }
	public double getPreco(){
    return this.ProdutoDecorado.getPreco();
  }

}

class Padrao extends ProdutoDecorator{
  public Padrao(Produto ProdutoDecorado){
    super(ProdutoDecorado);
  }
  
	public String formataParaImpressao() {
		return ProdutoDecorado.formataParaImpressao();
	}  
}

class Negrito extends ProdutoDecorator{
   public Negrito(Produto ProdutoDecorado) {
		super(ProdutoDecorado);
	}

	public String formataParaImpressao() {
    return
      "<span style=\"font-weight:bold\">" +
      this.ProdutoDecorado.formataParaImpressao() +
      "</span>";
	}
}

class Italico extends ProdutoDecorator{

  public Italico(Produto ProdutoDecorado) {
		super(ProdutoDecorado);
	}
  
public String formataParaImpressao() {
    return 
      "<span style=\"font-style:italic\">" +  
      this.ProdutoDecorado.formataParaImpressao() +
      "</span>";
	}
}

class CorDoTexto extends ProdutoDecorator{
  private String color;

  public CorDoTexto(Produto ProdutoDecorado, String color) {
		super(ProdutoDecorado);
    this.color=color;
	}
  
  public String formataParaImpressao() {
    return "<span style=\"color:"+this.color+"\">" +  
    this.ProdutoDecorado.formataParaImpressao() +
    "</span>";
	}
}