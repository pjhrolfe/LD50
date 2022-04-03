using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class DialogueChoice : MonoBehaviour
{
    public string content;
    public int index;

    public Narrative narrative;
    private Button _button;
    private TextMeshProUGUI _textMeshProUGUI;

    private void Awake() {
        GameObject textObject = transform.GetChild(0).gameObject;
        _button = GetComponent<Button>();
        _textMeshProUGUI = textObject.GetComponent<TextMeshProUGUI>();

        _button.onClick.AddListener(Choose);
    }

    private void Choose() {
        narrative.Choose(index);
    }
    
    public void Setup() {
        _textMeshProUGUI.text = content;
    }

}
