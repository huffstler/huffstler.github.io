# Typescript + React Hooks  + (`<form>` & `<input>`)

I've started learning React for my job. It's different, and early enough where i'm not sure if I like it yet or not. The world of web tech is certainly different from what I'm used to (Java). One of the first things that wasn't immediately 'accessible' to me was interacting with `<form>`'s. 

What I'm building currently is simple. Like, _easy_ simple. And yet, here I am writing a 'whole' blog post about it.

I'm only worrying about 2 elements on the page: 
- A `<form>` element where users will upload multiple files.
- A `<button>` that users click to 'process' those files.

In reality there's other components that are already taken care of by people that aren't me, so I'm ignoring them.

After going through the [Getting Started with React Guide](https://reactjs.org/docs/getting-started.html) I was able to slap some components on a page, _without_ any state. Statefulness is necessary in any application worth using though, so I had to go farther in my research. 

There are other developers who got on the 'React Train' before I did (lucky them) and so they got to decide how we would go about developing programs in React. One of the standards that was decided on is that we're not using any class components, only functional components. If you'd like to know what the difference between class & functional components is, you can read the following links: [React Components and Props](https://reactjs.org/docs/components-and-props.html), [Difference beween functional and class components](https://medium.com/@Zwenza/functional-vs-class-components-in-react-231e3fbd7108)

Essentially, I needed 3 total components for what i'm looking to do:
    1. A 'holding' component that managed state for its two children components
    2. An `<input>` component
    3. A `<button>` component

Here's a quick overview of what each looked like (Note: We're also using `Typescript`, so you might see some unfamiliar things depending on if you've used it before.)

#### ProcessButton.tsx

```typescript
export const ProcessButton: FunctionComponent = () => {
    return (
        <button type="submit">
            Process Files
        </button>
    );
};
```

#### FileInputter.tsx

```typescript
type FileInputTypes = {
    fileInput: React.Ref<HTMLInputElement>
}

export const FileInputter: FunctionComponent<FileInputTypes> = props => {
    return (
        <label>
            Upload the files.
            <input multiple type="file" ref={props.fileInput}/>
        </label>
    );
};
```

#### UploadPageComponent.tsx

```typescript
export const UploadPageContent: FunctionComponent = () => {
    
    const fileInputRef = useRef<HTMLInputElement>(null);    

    const sendFileData = (e: FormEvent) => {
        e.preventDefault();
        // Ideally, we would send the multi-part data to the backend service here. 
        // I haven't gotten that far yet *shrug*
        alert(`filename is: $fileinputRef?.current?.files?.[0].name}`);
    };

    return (
        <form encType="multipart/form-data" onSubmit={sendFileData}>
            <FileInputter fileInput={fileInputRef}/>
            <ProcessButton/>
        </form>
    );
};
```

Once I get some sleep I'll revisit what I have here and go more in depth with what's going on.

Time to `pandoc ./src/inputHooks.md -s -o ../srv/inputHooks.html`!