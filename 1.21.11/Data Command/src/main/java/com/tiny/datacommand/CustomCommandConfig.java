package com.tiny.datacommand;

import java.util.List;

public class CustomCommandConfig {
    public int permission_level = 0; // 0 to 4 (Vanilla max is 4)
    public String function;
    public List<ArgConfig> args;

    public static class ArgConfig {
        public String name;
        public String type; // "String", "Integer", "Boolean"
        public boolean required;
        public String defaultValue; // Match named 'default' in json via Gson serialization rules or naming
    }
}