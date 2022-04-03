using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.SceneManagement;

[System.Serializable] public class Game : MonoBehaviour {
    
    public Node firstNode;
    public List<Node.NodeData> nodeDatas;

    private static Game _instance;

    [SerializeField] private Node _currentNode;
    [SerializeField] private string _currentNodeName;

    public int fuel = 3;
    public int supplies = 10;
    public int karma;
    public int politeness;

    public static Game Instance {
        get {
            if (_instance == null) {
                var instance = GameObject.FindObjectOfType<Game>();

                if (instance == null) {
                    GameObject gameObj = new GameObject("Game");
                    instance = gameObj.AddComponent<Game>();

                    instance.Constructor();
                    
                    DontDestroyOnLoad(gameObj);
                }
            }   
            return _instance;
        }
    }

    private void Start() {
        if (_instance == null) {
            _instance = this;
            
            _instance.Constructor();
            
            DontDestroyOnLoad(this.gameObject);
        }
        else {
            Destroy(gameObject);
        }
    }

    private void Constructor() {
        SetCurrentNode(firstNode);
        SceneManager.sceneLoaded += OnSceneLoaded;
        nodeDatas = new List<Node.NodeData>();
    }

    public void SetCurrentNode(Node node) {
        if (_currentNode != null) {
            _currentNode.RemoveCurrent();
        } else {
            
        }
        _currentNode = node;
        _currentNodeName = _currentNode.name;
        _currentNode.SetCurrent();
    }

    public Node GetCurrentNode() {
        return _currentNode;
    }

    public void OnSceneLoaded(Scene scene, LoadSceneMode mode) {
        Node[] nodes = FindObjectsOfType<Node>();
        foreach (Node eachNode in nodes) {
            if (eachNode.name.Equals(_currentNodeName)) {
                SetCurrentNode(eachNode);
            }

            foreach (Node.NodeData nodeData in nodeDatas) {
                if (eachNode.name.Equals(nodeData.scenario) && nodeData.beenVisited) {
                    eachNode.SetVisited();
                }
            }
        }
    }

}
