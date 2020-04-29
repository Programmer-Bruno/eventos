package com.qintess.eventos.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cliente {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long codigo;
	@Column(nullable = false)
	private String nome;
	@Column(nullable = false)
	private int idade;
	@Column(nullable = false)
	private String email;
	@Column(nullable = false)
	private String cpf;
	@Column(nullable = false)
	private String senha;
	
	public Cliente() {
	}

	public Cliente(long codigo, String nome, int idade, String email, String cpf) {
		this.codigo = codigo;
		this.nome = nome;
		this.idade = idade;
		this.email = email;
		this.cpf = cpf;
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

	public int getIdade() {
		return idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
