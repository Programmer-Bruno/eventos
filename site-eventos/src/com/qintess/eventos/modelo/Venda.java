package com.qintess.eventos.modelo;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Venda {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long codigo;
	private double valor_total;
	private LocalDateTime data = LocalDateTime.now();
	@OneToMany(mappedBy = "venda", cascade = CascadeType.ALL)
	private List<VendaIngresso> ingressos = new ArrayList<>();
	
	public Venda() {
	}
	
	public void addIngresso(VendaIngresso ingresso) {
		ingressos.add(ingresso);
	}

	public Venda(double valor_total) {
		this.valor_total = valor_total;
	}

	public long getCodigo() {
		return codigo;
	}

	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}

	public double getValor_total() {
		return valor_total;
	}

	public void setValor_total(double valor_total) {
		this.valor_total = valor_total;
	}

	public LocalDateTime getData() {
		return data;
	}

	public void setData(LocalDateTime data) {
		this.data = data;
	}

	public List<VendaIngresso> getIngressos() {
		return ingressos;
	}

	public void setIngressos(List<VendaIngresso> ingressos) {
		this.ingressos = ingressos;
	}
	
	
}
