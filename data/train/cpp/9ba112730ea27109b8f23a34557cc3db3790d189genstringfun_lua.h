/*
 * File automatically generated by
 * gengen 1.4.3 by Lorenzo Bettini 
 * http://www.gnu.org/software/gengen
 */

#ifndef GENSTRINGFUN_LUA_GEN_CLASS_H
#define GENSTRINGFUN_LUA_GEN_CLASS_H

#include <string>
#include <iostream>

using std::string;
using std::ostream;

class genstringfun_lua_gen_class
{
 protected:

 public:
  genstringfun_lua_gen_class()
  {
  }
  

  void generate_genstringfun_lua(ostream &stream, unsigned int indent = 0)
  {
    string indent_str (indent, ' ');
    indent = 0;
  
    stream << "\n";
    stream << indent_str;
    stream << "function strchr_tab(tab, char)";
    stream << "\n";
    stream << indent_str;
    stream << "  local store";
    stream << "\n";
    stream << indent_str;
    stream << "  local ret_str = \"\"";
    stream << "\n";
    stream << indent_str;
    stream << "  for w, k in ipairs(tab) do";
    stream << "\n";
    stream << indent_str;
    stream << "    if(k == char) then";
    stream << "\n";
    stream << indent_str;
    stream << "      store = w";
    stream << "\n";
    stream << indent_str;
    stream << "      break";
    stream << "\n";
    stream << indent_str;
    stream << "    end";
    stream << "\n";
    stream << indent_str;
    stream << "  end";
    stream << "\n";
    stream << indent_str;
    stream << "  if(store == nil) then";
    stream << "\n";
    stream << indent_str;
    stream << "    return nil";
    stream << "\n";
    stream << indent_str;
    stream << "  end";
    stream << "\n";
    stream << indent_str;
    stream << "  for i = store, #tab do";
    stream << "\n";
    stream << indent_str;
    stream << "    ret_str = ret_str .. tab[i]";
    stream << "\n";
    stream << indent_str;
    stream << "  end";
    stream << "\n";
    stream << indent_str;
    stream << "  return store, ret_str";
    stream << "\n";
    stream << indent_str;
    stream << "end";
    stream << "\n";
    stream << indent_str;
    stream << "\n";
    stream << indent_str;
    stream << "function str_to_tab(str)";
    stream << "\n";
    stream << indent_str;
    stream << "  tab = {}";
    stream << "\n";
    stream << indent_str;
    stream << "  for i in string.gmatch(str, \".\") do";
    stream << "\n";
    stream << indent_str;
    stream << "    table.insert(tab, i)";
    stream << "\n";
    stream << indent_str;
    stream << "  end";
    stream << "\n";
    stream << indent_str;
    stream << "  return tab";
    stream << "\n";
    stream << indent_str;
    stream << "end";
    stream << "\n";
    stream << indent_str;
    stream << "\n";
    stream << indent_str;
    stream << "function generate_string(s, stream, indent)";
    stream << "\n";
    stream << indent_str;
    stream << "  local subs = s";
    stream << "\n";
    stream << indent_str;
    stream << "  local indent_str = \"\"";
    stream << "\n";
    stream << indent_str;
    stream << "  local id = {}";
    stream << "\n";
    stream << indent_str;
    stream << "  local pos = 0";
    stream << "\n";
    stream << indent_str;
    stream << "  local my_tab = str_to_tab(s)";
    stream << "\n";
    stream << indent_str;
    stream << "\n";
    stream << indent_str;
    stream << "  -- save context";
    stream << "\n";
    stream << indent_str;
    stream << "  local ctx = io.output()";
    stream << "\n";
    stream << indent_str;
    stream << "  io.output(stream)";
    stream << "\n";
    stream << indent_str;
    stream << "\n";
    stream << indent_str;
    stream << "  if((indent == 0) or (strchr_tab(my_tab, \"\\n\") == nil)) then";
    stream << "\n";
    stream << indent_str;
    stream << "    io.write(s)";
    stream << "\n";
    stream << indent_str;
    stream << "    return";
    stream << "\n";
    stream << indent_str;
    stream << "  end";
    stream << "\n";
    stream << indent_str;
    stream << "\n";
    stream << indent_str;
    stream << "  for i = 1, indent do";
    stream << "\n";
    stream << indent_str;
    stream << "    id[#id + 1] = ' '";
    stream << "\n";
    stream << indent_str;
    stream << "  end";
    stream << "\n";
    stream << indent_str;
    stream << "  indent_str = table.concat(id)";
    stream << "\n";
    stream << indent_str;
    stream << "\n";
    stream << indent_str;
    stream << "  while(true) do";
    stream << "\n";
    stream << indent_str;
    stream << "    pos, subs = strchr_tab(str_to_tab(s), '\\n')";
    stream << "\n";
    stream << indent_str;
    stream << "    if(subs == nil) then break end";
    stream << "\n";
    stream << indent_str;
    stream << "    io.write(table.concat(my_tab, \"\", 1, pos))";
    stream << "\n";
    stream << indent_str;
    stream << "    s = subs:sub(2)";
    stream << "\n";
    stream << indent_str;
    stream << "    my_tab = str_to_tab(s)";
    stream << "\n";
    stream << indent_str;
    stream << "    if(s ~= \"\") then";
    stream << "\n";
    stream << indent_str;
    stream << "      io.write(indent_str);";
    stream << "\n";
    stream << indent_str;
    stream << "    end";
    stream << "\n";
    stream << indent_str;
    stream << "  end";
    stream << "\n";
    stream << indent_str;
    stream << "  if(s) then";
    stream << "\n";
    stream << indent_str;
    stream << "    io.write(s)";
    stream << "\n";
    stream << indent_str;
    stream << "  end";
    stream << "\n";
    stream << indent_str;
    stream << "\n";
    stream << indent_str;
    stream << "  -- restore context";
    stream << "\n";
    stream << indent_str;
    stream << "  io.output(ctx)";
    stream << "\n";
    stream << indent_str;
    stream << "end";
    stream << "\n";
    stream << indent_str;
  }
};

#endif // GENSTRINGFUN_LUA_GEN_CLASS_H