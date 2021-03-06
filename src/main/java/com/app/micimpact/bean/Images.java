/*
 * Created on 21 12월 2015 ( Time 14:20:19 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.bean;

import java.io.Serializable;

import javax.validation.constraints.*;


public class Images implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @NotNull
    private Integer id;

    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @NotNull
    private Integer cardId;

    @Size( max = 255 )
    private String imageUrl;



    //----------------------------------------------------------------------
    // GETTER & SETTER FOR THE KEY FIELD
    //----------------------------------------------------------------------
    public void setId( Integer id ) {
        this.id = id ;
    }

    public Integer getId() {
        return this.id;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR FIELDS
    //----------------------------------------------------------------------
    public void setCardId( Integer cardId ) {
        this.cardId = cardId;
    }
    public Integer getCardId() {
        return this.cardId;
    }

    public void setImageUrl( String imageUrl ) {
        this.imageUrl = imageUrl;
    }
    public String getImageUrl() {
        return this.imageUrl;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
 
        public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append(id);
        sb.append("|");
        sb.append(cardId);
        sb.append("|");
        sb.append(imageUrl);
        return sb.toString(); 
    } 


}
