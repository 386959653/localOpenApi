package com.weichi.erp.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * Created by Wewon on 2018/9/14.
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "xparam")
public class ShortcutPhrase {
    @XmlElement
    private List<ShortcutPhraseItem> shortcutPhraseItemList;

    public List<ShortcutPhraseItem> getShortcutPhraseItemList() {
        return shortcutPhraseItemList;
    }

    public void setShortcutPhraseItemList(List<ShortcutPhraseItem> shortcutPhraseItemList) {
        this.shortcutPhraseItemList = shortcutPhraseItemList;
    }
}
