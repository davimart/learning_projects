
//Implementa os critérios de filtragem dos dados

//Os critérios são chamados como argumento da classe GeradorDeRelatorios()

public interface CriterioFiltro {
  boolean testar(Produto p);
  String getNome();
}


class Todos implements CriterioFiltro {
	@Override
  public boolean testar(Produto p){ 
    return true; 
  }
  @Override
  public String getNome(){
    return "Todos";
  }
    
}


class EstoqueMenorOuIgual implements CriterioFiltro {
    private int limiteEstoque;

    public EstoqueMenorOuIgual(int limiteEstoque) {
        this.limiteEstoque = limiteEstoque;
    }

    @Override
    public boolean testar(Produto p) {
        return p.getQtdEstoque() <= this.limiteEstoque;
    }

    @Override
    public String getNome(){
      return "Estoque menor ou igual a " + limiteEstoque;
    }
}

class MesmaCategoria implements CriterioFiltro {
    private String categoria;

    public MesmaCategoria(String categoria) {
        this.categoria = categoria;
    }

    @Override
    public boolean testar(Produto p) {
        return this.categoria.equals(p.getCategoria());
    }
  @Override
    public String getNome(){
      return "Categoria = " + categoria;
    }
}


class IntervaloDePreco implements CriterioFiltro{
    private double inicio, fim;

    public IntervaloDePreco(double inicio, double fim) {
        this.inicio = inicio;
        this.fim = fim;
    }

    @Override
    public boolean testar(Produto p) {
        return inicio <= p.getPreco() && fim >= p.getPreco();
    }

    @Override
    public String getNome() {
        return "Preço entre " + inicio + " e " + fim;
    }
}

class DescricaoContem implements CriterioFiltro{
  private String texto;

  public DescricaoContem(String texto){
    this.texto = texto;
  }

  @Override
    public boolean testar(Produto p) {
        return p.getDescricao().contains(texto);
    }

    @Override
    public String getNome() {
        return "Descrição contém \"" + texto + "\"";
    }
}

