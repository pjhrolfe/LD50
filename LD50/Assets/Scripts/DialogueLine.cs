using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class DialogueLine : MonoBehaviour {

    public string content;
    public List<string> tags;

    private Speaker _speaker = Speaker.Game;
    private TextMeshProUGUI _textMeshProUGUI;
    
    private Color _playerColor = new Color(0.3f, 0.3f, 1f);
    private Color _contactColor = new Color(1f, 0.3f, 0.3f);
    private Color _hackColor = new Color(0.3f, 1f, 0.3f);

    private void Awake() {
        _textMeshProUGUI = GetComponent<TextMeshProUGUI>();
    }

    public void Setup() {
        _textMeshProUGUI.text = content;

        if (tags.Count > 0) {
            switch (tags[0]) {
                case "game":
                    _speaker = Speaker.Game;
                    break;
                case "player":
                    _speaker = Speaker.Player;
                    break;
                case "contact":
                    _speaker = Speaker.Contact;
                    break;
                case "hack":
                    _speaker = Speaker.Hack;
                    break;
            }
        }
        
        switch (_speaker) {
            case Speaker.Game:
                _textMeshProUGUI.color = Color.white;
                _textMeshProUGUI.alignment = TextAlignmentOptions.Center;
                break;
            case Speaker.Player:
                _textMeshProUGUI.color = _playerColor;
                _textMeshProUGUI.alignment = TextAlignmentOptions.Left;
                break;
            case Speaker.Contact:
                _textMeshProUGUI.color = _contactColor;
                _textMeshProUGUI.alignment = TextAlignmentOptions.Right;
                break;
            case Speaker.Hack:
                _textMeshProUGUI.color = _hackColor;
                _textMeshProUGUI.alignment = TextAlignmentOptions.Center;
                break;
        }
    }

    public enum Speaker {
        Game,
        Player,
        Contact,
        Hack
    }


}
