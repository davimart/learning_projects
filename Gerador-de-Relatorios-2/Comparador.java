import java.util.Comparator;

//Implementa os comparadores que permitirão alterar os algoritmos de ordenação
//entre Ascendente e Descendente

//Os comparadores são chamados como argumento da classe GeradorDeRelatorios()

//Nome dos comparadores segue o padrão 'Comparador' +
//atributo comparado +
//'Asc' para Ascendente / 'Desc' para Descendente 

class ComparadorDescricaoAsc implements Comparator<Produto> {
  @Override
  public int compare(Produto p1, Produto p2) {
    return p1.getDescricao().compareToIgnoreCase(p2.getDescricao());
  }
}

class ComparadorDescricaoDesc implements Comparator<Produto> {
  @Override
  public int compare(Produto p1, Produto p2) {
    return p2.getDescricao().compareToIgnoreCase(p1.getDescricao());
  }
}



class ComparadorEstoqueAsc implements Comparator<Produto> {
  @Override
  public int compare(Produto p1, Produto p2) {
    return Integer.compare(p1.getQtdEstoque(), p2.getQtdEstoque());
  }
}

class ComparadorEstoqueDesc implements Comparator<Produto> {
  @Override
  public int compare(Produto p1, Produto p2) {
    return Integer.compare(p2.getQtdEstoque(), p1.getQtdEstoque());
  }
}



class ComparadorPrecoAsc implements Comparator<Produto> {
  @Override
  public int compare(Produto p1, Produto p2) {
    return Double.compare(p1.getPreco(), p2.getPreco());
  }
}

class ComparadorPrecoDesc implements Comparator<Produto> {
  @Override
  public int compare(Produto p1, Produto p2) {
    return Double.compare(p2.getPreco(), p1.getPreco());
  }
}
