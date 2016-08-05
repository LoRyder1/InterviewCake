

for (int a0 = 0; a0 < t; a0++)
{
    string s = Console.ReadLine();

    if (s.Length % 2 != 0) { Console.WriteLine(-1); continue; }
    Dictionary<char, int> l = new Dictionary<char, int>();

    int half = s.Length / 2;
    
    for (int i = 0; i < half; i++)
    {
        if (i < half)
        {
            if (l.ContainsKey(s[i])) l[s[i]]++;
            else l.Add(s[i], 1);
        }
    }

    int qtyDiff = 0;
    for (int j = half; j < s.Length; j++)
    {
        if (l.ContainsKey(s[j]) && l[s[j]] > 0) l[s[j]]--;
        else qtyDiff++;
    }

    Console.WriteLine(qtyDiff);
}



