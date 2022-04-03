using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Node : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler {
    public NodeType nodeType;
    public List<Node> linkedNodes;
    public string scenario;

    private Animator _animator;
    private Button _button;

    private bool _mouseOver;

    public bool beenVisited;

    public struct NodeData {
        public string scenario;
        public bool beenVisited;
    }

    private void Awake() {
        _animator = GetComponent<Animator>();
        _button = GetComponent<Button>();
        _button.onClick.AddListener(LoadScenario);
    }

    private void Update() {
        if (_mouseOver) {
            MouseOver();
        }
    }

    public enum NodeType {
        Diplomatic,
        Military,
        Civilian,
        Unoccupied
    }

    public void SetCurrent() {
        _animator.SetBool("isCurrentNode", true);
        foreach (Node node in linkedNodes) {
            if (node.beenVisited == false) {
                node.SetReachable();
            } else {
                node.SetVisited();
            }
        }
    }

    public void RemoveCurrent () {
        _animator.SetBool("isCurrentNode", false);
        foreach (Node node in linkedNodes) {
            node.RemoveReachable();
        }

        beenVisited = true;
    }

    public void SetReachable() {
        _animator.SetBool("isReachable", true);
    }

    public void RemoveReachable() {
        _animator.SetBool("isReachable", false);
    }

    public void SetVisited() {
        _animator.SetBool("beenVisited", true);
        beenVisited = true;
    }
    private void MouseOver() {
        foreach (Node node in linkedNodes) {
            if (node != null) {
                Draw.DrawLine(transform.position, node.transform.position, Color.gray, 0.05f);
            }
        }
    }

    public void OnPointerEnter(PointerEventData eventData) {
        _mouseOver = true;
    }
    
    public void OnPointerExit(PointerEventData eventData) {
        _mouseOver = false;
        foreach (GameObject gameObject in GameObject.FindGameObjectsWithTag("Temp")) {
            Destroy(gameObject);
        }

        Draw.ClearLines();
    }

    public void LoadScenario() {
        if (Game.Instance.GetCurrentNode() != this && Game.Instance.GetCurrentNode().linkedNodes.Contains(this) && !beenVisited) {
            Game.Instance.SetCurrentNode(this);
            //Game.Instance.map.gameObject.SetActive(false);
            Game.Instance.nodeDatas.Clear();
            Node[] nodes = FindObjectsOfType<Node>();
            foreach (Node node in nodes) {
                NodeData nodeData = new NodeData();
                nodeData.scenario = node.scenario;
                nodeData.beenVisited = node.beenVisited;
                Game.Instance.nodeDatas.Add(nodeData);
            }
            SceneManager.LoadScene(scenario);
        }
    }
}
