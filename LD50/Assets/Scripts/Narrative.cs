using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using UnityEngine.SceneManagement;
using UnityEngine.UIElements;

public class Narrative : MonoBehaviour {
    public List<GameObject> lines;
    public List<GameObject> choices;
    public GameObject linePrefab;
    public GameObject choicePrefab;
    public Scrollbar scrollbar;
    public GameObject contentHolder; // TODO: rename to lineHolder
    public GameObject choiceHolder;
    public TextAsset scenarioInkAsset;
    private Story _scenarioStory;

    private bool _choicesCreated;
    
    private float _nextLineTimer;
    private float _nextLineTime = 1.5f;

    private void Awake() {
        _scenarioStory = new Story(scenarioInkAsset.text);
        UpdateVars();
        _nextLineTimer = _nextLineTime;
    }

    private void Update() {
        _nextLineTimer += Time.deltaTime;
        
        while (_scenarioStory.canContinue && _nextLineTimer > _nextLineTime) {
            GameObject newLine = Instantiate(linePrefab, contentHolder.transform);
            newLine.GetComponent<DialogueLine>().content = _scenarioStory.Continue();
            newLine.GetComponent<DialogueLine>().tags = _scenarioStory.currentTags;
            newLine.GetComponent<DialogueLine>().Setup();
            lines.Add(newLine);
            _nextLineTimer = 0f;

            if (_scenarioStory.currentTags.Count > 2) {
                string lineTag = _scenarioStory.currentTags[1];
                string[] lineTagSplit = lineTag.Split("/");
                

                string deltaTag = _scenarioStory.currentTags[2];
                string[] deltaTagSplit = deltaTag.Split("/");
                
                foreach (string s in deltaTagSplit)
                {
                    Debug.Log(s);
                }

                for (int i = 0; i < lineTagSplit.Length; i++) {
                    UseTag(lineTagSplit[i], int.Parse(deltaTagSplit[i]));
                }
            }
            UpdateVars();
        }

        if (_scenarioStory.currentChoices.Count > 0 && !_choicesCreated) {
            foreach (Choice choice in _scenarioStory.currentChoices) {
                GameObject newChoice = Instantiate(choicePrefab, choiceHolder.transform);
                newChoice.GetComponent<DialogueChoice>().content = choice.text;
                newChoice.GetComponent<DialogueChoice>().index = choice.index;
                newChoice.GetComponent<DialogueChoice>().narrative = this;
                newChoice.GetComponent<DialogueChoice>().Setup();
                choices.Add(newChoice);
            }

            _choicesCreated = true;
        }

        if (!_scenarioStory.canContinue && _scenarioStory.currentChoices.Count == 0) {
            //Game.Instance.map.gameObject.SetActive(true);
            if (SceneManager.GetActiveScene().name.Equals("TheEnd")) {
                Debug.Log(SceneManager.GetActiveScene().name);
                SceneManager.LoadScene("Credits");
            }
            else {
                SceneManager.LoadScene("MapView");
            }
        }
        
        ScrollToBottom();
    }

    public void UseTag(string lineTag, int delta) {
        Debug.Log(lineTag + " " + delta);
        switch (lineTag) {
            case "+fuel":
                Game.Instance.fuel += delta;
                break;
            case "-fuel":
                Game.Instance.fuel -= delta;
                break;
            case "+supplies":
                Game.Instance.supplies += delta;
                break;
            case "-supplies":
                Game.Instance.supplies -= delta;
                break;
            case "+karma":
                Game.Instance.karma += delta;
                break;
            case "-karma":
                Game.Instance.karma -= delta;
                break;
            case "+politeness":
                Game.Instance.politeness += delta;
                break;
            case "-politeness":
                Game.Instance.politeness -= delta;
                break;
        }   
    }

    public void Choose(int index) {
        _scenarioStory.ChooseChoiceIndex(index);
        foreach (GameObject choice in choices) {
            Destroy(choice);
        }

        _choicesCreated = false;
    }

    private void UpdateVars() {
        _scenarioStory.variablesState["fuel"] = Game.Instance.fuel;
        _scenarioStory.variablesState["supplies"] = Game.Instance.supplies;
        _scenarioStory.variablesState["karma"] = Game.Instance.karma;
        _scenarioStory.variablesState["politeness"] = Game.Instance.politeness;
    }

    public void ScrollToBottom() {
        scrollbar.value = 0;
    }

}
