package com.qintess.eventos.modelo;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
public class Evento {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long codigo;
	private String nome;
	private String descricao;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private LocalDateTime data;
	@Column(precision=10, scale=2)
	private Double preco;
	private int quant_ingresso;
	
	@Lob
	@Column(columnDefinition = "mediumblob")
	private byte[] imagemProd;
	
	@Transient //esse campo não será persistido no hibernate
	private String imagemEncoded;

	

	@ManyToOne
	private CasaDeShow casaDeShow;
	@OneToMany(mappedBy = "evento")
	private List<VendaIngresso> ingressos;
	
	public Evento() {
	}

	public Evento(String nome, String descricao, LocalDateTime data, Double preco, int quant_ingresso,
			CasaDeShow casaDeShow) {
		this.nome = nome;
		this.descricao = descricao;
		this.data = data;
		this.preco = preco;
		this.quant_ingresso = quant_ingresso;
		this.casaDeShow = casaDeShow;
	}

	public long getCodigo() {
		return codigo;
	}

	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public LocalDateTime getData() {
		return data;
	}

	public void setData(LocalDateTime data) {
		this.data = data;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public int getQuant_ingresso() {
		return quant_ingresso;
	}

	public void setQuant_ingresso(int quant_ingresso) {
		this.quant_ingresso = quant_ingresso;
	}

	public CasaDeShow getCasaDeShow() {
		return casaDeShow;
	}

	public void setCasaDeShow(CasaDeShow casaDeShow) {
		this.casaDeShow = casaDeShow;
	}

	public List<VendaIngresso> getIngressos() {
		return ingressos;
	}

	public void setIngressos(List<VendaIngresso> ingressos) {
		this.ingressos = ingressos;
	}
	public byte[] getImagemProd() {
		return imagemProd;
	}

	public void setImagemProd(byte[] imagemProd) {
		this.imagemProd = imagemProd;
	}
	
	public String getImagemEncoded() {
		return imagemEncoded;
	}

	public void setImagemEncoded(String imagemEncoded) {
		this.imagemEncoded = imagemEncoded;
	}
	
}
