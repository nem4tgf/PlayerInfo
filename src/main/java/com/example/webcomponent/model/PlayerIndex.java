package com.example.webcomponent.model;

public class PlayerIndex {
    private int id;
    private String playerName;
    private String playerAge;
    private String indexName;
    private float value;

    public PlayerIndex(int id, String playerName, String playerAge, String indexName, float value) {
        this.id = id;
        this.playerName = playerName;
        this.playerAge = playerAge;
        this.indexName = indexName;
        this.value = value;
    }

    public int getId() {
        return id;
    }

    public String getPlayerName() {
        return playerName;
    }

    public String getPlayerAge() {
        return playerAge;
    }

    public String getIndexName() {
        return indexName;
    }

    public float getValue() {
        return value;
    }
}
