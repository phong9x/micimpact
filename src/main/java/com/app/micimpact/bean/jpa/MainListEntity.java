/*
 * Created on 8 1월 2016 ( Time 16:15:45 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
// This Bean has a basic Primary Key (not composite) 

package com.app.micimpact.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;


import javax.persistence.*;

/**
 * Persistent class for entity stored in table "main_list"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="main_list", catalog="micimpact" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="MainListEntity.countAll", query="SELECT COUNT(x) FROM MainListEntity x" )
} )
public class MainListEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id", nullable=false)
    private Integer    id           ;


    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @Column(name="card_id", nullable=false)
    private Integer    cardId       ;

    @Column(name="order", nullable=false)
    private Integer    order        ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public MainListEntity() {
		super();
    }
    
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
    //--- DATABASE MAPPING : card_id ( INT ) 
    public void setCardId( Integer cardId ) {
        this.cardId = cardId;
    }
    public Integer getCardId() {
        return this.cardId;
    }

    //--- DATABASE MAPPING : order ( INT ) 
    public void setOrder( Integer order ) {
        this.order = order;
    }
    public Integer getOrder() {
        return this.order;
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
        sb.append(id);
        sb.append("]:"); 
        sb.append(cardId);
        sb.append("|");
        sb.append(order);
        return sb.toString(); 
    } 

}