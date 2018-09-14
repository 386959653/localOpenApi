package com.weichi.erp.domain;

import com.weichi.erp.component.Jaxb.CDATASectionAdapter;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

/**
 * Created by Wewon on 2018/9/14.
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class ShortcutPhraseItem {
    @XmlElement
    @XmlJavaTypeAdapter(CDATASectionAdapter.class)
    private String sCode = "";
    @XmlElement
    @XmlJavaTypeAdapter(CDATASectionAdapter.class)
    private String sText = "";
    @XmlElement
    @XmlJavaTypeAdapter(CDATASectionAdapter.class)
    private String sGroupName = "";

    public String getsCode() {
        return sCode;
    }

    public void setsCode(String sCode) {
        this.sCode = sCode;
    }

    public String getsText() {
        return sText;
    }

    public void setsText(String sText) {
        this.sText = sText;
    }

    public String getsGroupName() {
        return sGroupName;
    }

    public void setsGroupName(String sGroupName) {
        this.sGroupName = sGroupName;
    }
}
