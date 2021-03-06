/*
 * Created on 21 12월 2015 ( Time 14:22:53 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
// This Bean has a basic Primary Key (not composite) 

package com.app.micimpact.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;



import javax.persistence.*;

/**
 * Persistent class for entity stored in table "list_cards"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="list_cards", catalog="micimpact" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="ListCardsEntity.countAll", query="SELECT COUNT(x) FROM ListCardsEntity x" )
} )
public class ListCardsEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------

    @Id
    @Column(name="id", nullable=false)
    private Integer id;
    
    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @Column(name="collection_id", nullable=false)
    private Integer    collectionId ;

    @Column(name="card_id", nullable=false)
    private Integer    cardId       ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public ListCardsEntity() {
		super();
    }
    
    //----------------------------------------------------------------------
    // GETTER & SETTER FOR THE KEY FIELD
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR FIELDS
    //----------------------------------------------------------------------
    //--- DATABASE MAPPING : collection_id ( INT ) 
    public void setCollectionId( Integer collectionId ) {
        this.collectionId = collectionId;
    }
    public Integer getCollectionId() {
        return this.collectionId;
    }

    //--- DATABASE MAPPING : card_id ( INT ) 
    public void setCardId( Integer cardId ) {
        this.cardId = cardId;
    }
    public Integer getCardId() {
        return this.cardId;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR LINKS
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
    public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append("["); 
        sb.append("]:"); 
        sb.append(collectionId);
        sb.append("|");
        sb.append(cardId);
        return sb.toString(); 
    } 

}
