import os
def parse_ll_files(file_dir, out_dir):

    with open(file_dir, 'r') as file:
        file_lines = file.readlines()

    sep_indices = [ i for i, ln in enumerate(file_lines) if ln.startswith("*" * 5) ]
    ll_files = []
    idx = 0

    for sep in sep_indices:
        if idx < sep: 
            ll_files.append('\n'.join(file_lines[idx:sep]))
        idx = sep + 1

    ll_files.append('\n'.join(file_lines[idx:]))

    for i, ll_file in enumerate(ll_files): 
        ll_filename = "inliner-{}.ll".format(i)
        with open(os.path.join(out_dir, ll_filename), 'w') as file:
            file.write(ll_file)

def inline(exclude_dirs):
    # base_depth = len(os.getcwd().rstrip(os.sep).split(os.sep))
    def exclude_file_fn(f):
        return f.endswith('.py') \
            or f.endswith('.cpp') \
            or f.endswith('Makefile') \
            or f.endswith('.o') \
            or f.endswith('.so') \
            or f.endswith('.sh')

    for root, dirs, files in os.walk('.'):
        dirs[:] = [ d for d in dirs if d not in exclude_dirs ]
        files = [ f for f in files if not exclude_file_fn(f) ]

        for file in files: 
            if not file.endswith('.txt'):
                continue
            # create llvm ir output directory
            
            ll_output_path = os.path.join(root, file[:-len('.inliner.txt')])
            if not os.path.exists(ll_output_path):
                os.mkdir(ll_output_path)

            # 
            parse_ll_files(os.path.join(root, file), out_dir=ll_output_path)



if __name__ == "__main__":
    exclude_dirs = ['venv', '.']
    inline(exclude_dirs=exclude_dirs)