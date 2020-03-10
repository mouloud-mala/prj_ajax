package com.lou.cours.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ParametresBD {
	/*		
	 * 		========================
	 * 		param�tres Serveur Mysql
	 * 		========================
	 */
		// d�finir les params de la BD Mysql  : 
		private static final String urlMY = "jdbc:mysql://localhost/bdtennis";
		private static final String userMY = "root";
		private static final String passwordMY = "root06";
		private static final String driverJMY = "com.mysql.cj.jdbc.Driver";
		/*
		 * 		==============================
		 *  	getteurs (pas de setteurs ici)
		 *  	==============================
		 */
		public static String getDriverJ() {
				return driverJMY;
		}
		public static String getUrl() {	
					return urlMY;
		}
		public static String getUser() {
					return userMY;
		}
		public static String getPassword() {
				return passwordMY;
		}
		// une m�thode qui permet d'interroger la bd : on lui passe une requete
		public static ResultSet executeRequeteSQL(String requete) 
						throws ClassNotFoundException{
			try {
				// je r�cup�re params BD
				String drv=getDriverJ();
				String url=getUrl();
				String usr=getUser();
				String pwd=getPassword();
				// je charge le driver jdbc
				Class.forName(drv);
				// je me connecte � la BD
				Connection connexion = DriverManager.getConnection(url
						,usr,pwd);
				// je fabrique une demande SQL
				Statement instruction = connexion.createStatement();
				// j'envoie la demande SQL � la BD et je r�cup�re le r�sultat
				ResultSet resultatTemp = instruction.executeQuery(requete);
				// je renvoie les lignes de la table au code appelant
				return resultatTemp;
				} 
			catch (Exception e) {
				return null;
				}
			}

		// une m�thode qui permet de faire les autres op�rations
		//	: insert ou delete ou update
	
	

	//		m�thode	:	pour ins�rer ou modifier ou supprimer
	//		dans la BD
	public static int executeUpdateSQL(String requete) throws ClassNotFoundException{
	try {
		Class.forName(getDriverJ());
		Connection connexion = DriverManager.getConnection(getUrl(),getUser(),getPassword());
		Statement instruction = connexion.createStatement();
		int resultatTemp = instruction.executeUpdate(requete);
		return resultatTemp;
		} 
	catch (Exception e) 
	{
		return -1;
		}
	}
	
	
}
