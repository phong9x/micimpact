
package com.app.micimpact.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;

import java.util.List;

import javax.persistence.*;

/**
 * Persistent class for entity stored in table "posting_types"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="posting_types", catalog="micimpact" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="PostingTypesEntity.countAll", query="SELECT COUNT(x) FROM PostingTypesEntity x" )
} )
public class PostingTypesEntity implements Serializable {

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
    @Column(name="posting_type", nullable=false, length=128)
    private String     postingType  ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------
    @OneToMany(mappedBy="postingTypes", targetEntity=PostingsEntity.class)
    private List<PostingsEntity> listOfPostings;


    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public PostingTypesEntity() {
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
    //--- DATABASE MAPPING : posting_type ( VARCHAR ) 
    public void setPostingType( String postingType ) {
        this.postingType = postingType;
    }
    public String getPostingType() {
        return this.postingType;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR LINKS
    //----------------------------------------------------------------------
    public void setListOfPostings( List<PostingsEntity> listOfPostings ) {
        this.listOfPostings = listOfPostings;
    }
    public List<PostingsEntity> getListOfPostings() {
        return this.listOfPostings;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
    public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append("["); 
        sb.append(id);
        sb.append("]:"); 
        sb.append(postingType);
        return sb.toString(); 
    } 

}
